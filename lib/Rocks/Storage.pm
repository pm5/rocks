package Rocks::Storage;

use v5.26;
use Mojolicious::Lite -signatures;

use Mojo::Pg;

my $schema = do { local $/ = undef; join "\n", <DATA> };

sub connect ($user, $pass, $host, $name)
{
    Mojo::Pg->new("postgresql://$user:$pass\@$host/$name")
}

sub migrate ($db)
{
    $db->migrations->from_string($schema)->migrate
}

sub rollback ($db)
{
    $db->migrations->migrate(0)
}

1;

__DATA__
-- 1 up
CREATE TABLE sources_hackmd (
    id VARCHAR(64) PRIMARY KEY
);
-- 1 down
DROP TABLE sources_hackmd;
