package Rocks::Utils;

use experimental qw[switch signatures];
use Mojo::UserAgent;

@EXPORT_OK = qw[zip2 ua];

sub zip2 { @_[map { $_, $_ + @_/2 } 0..(@_/2 - 1)] }

sub ua ($req) {
    my $ua = Mojo::UserAgent->new;
    $ua->start($ua->build_tx(
            $req->{method},
            $req->{base_url} . $req->{url}
        ))->result;
}

1;
