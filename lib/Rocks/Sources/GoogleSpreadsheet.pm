package Rocks::Sources::GoogleSpreadsheet;

use utf8;
use open IO => ":locale";
use Moo;
use Types::Standard qw[Str];
use Dotenv -load;

use aliased "Google::RestApi::Auth::ServiceAccount";
use aliased "Google::RestApi";
use aliased "Google::RestApi::SheetsApi4";

use Rocks::Utils qw[zip2];

use aliased "Rocks::Models::Project";
use aliased "Rocks::Models::Event";

my $sa = ServiceAccount->new(
    account_file => $ENV{GOOGLE_SERVICE_ACCOUNT_FILE},
    scope => ["http://spreadsheets.google.com/feeds/"],
);

my $g0v_db_url = $ENV{G0V_DATABASE_SPREADSHEET_URL};
my $hackathon_id = $ENV{G0V_DATABASE_HACKATHON_SHEET};

my $rest = RestApi->new(auth => $sa);
my $sheets = SheetsApi4->new(api => $rest);
my $sheet = $sheets->open_spreadsheet(uri => $g0v_db_url);

my $hackathon_sheet = $sheet->open_worksheet(id => $hackathon_id);

my $pull_limit = 20;


sub pull
{
    my $self = shift;
    my $fieldnames = $hackathon_sheet->rows([1])->[0];

    my %events = ();
    my %presents = ();
    my %projects = ();

    foreach (@{$hackathon_sheet->rows([2 .. $pull_limit])}) {
        my %record = Rocks::Utils::zip2(@$fieldnames, @$_);

        my $project = ($projects{$record{project}} ||= Project->new(
                name => $record{project},
                three_brief => [ split /[,，、]\s*/, $record{"three brief"} ],
            ));

        my $event = ($events{$record{"event name"}} ||= Event->new(
                name => $record{"event name"},
            ));
    }

    evets => \%events, presentations => \%presents, projects => \%projects
}

1;
