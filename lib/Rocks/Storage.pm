package Rocks::Storage;

use v5.26;
use utf8;
use warnings;
use feature qw(signatures);
no warnings qw(experimental::signatures);

use Mojo::Pg;

my $schema = do { local $/ = undef; <DATA> };

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
-- 1 down
