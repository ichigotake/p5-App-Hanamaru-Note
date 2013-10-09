use strict;
use warnings;
use FindBin;
use Config::Micro;
use File::Spec;
use Plack::Builder;
use Plack::Middleware::Static;

my $root;
BEGIN {
    use File::Basename (); 
    use File::Spec     (); 

    $root = File::Basename::dirname(__FILE__);
    $root = File::Spec->rel2abs($root);

    unshift @INC, "$root/../../lib";
}
use lib ("$FindBin::Bin/lib", "$FindBin::Bin/extlib/lib/perl5");
use Hanamaru;
my $config = require( Config::Micro->file( dir => File::Spec->catdir($root, 'etc','conf') ) );

builder {
    enable 'Plack::Middleware::Static',
        root => File::Spec->catfile($root),
        path => qr{^/static/};

    '/' => Hanamaru->run( %$config );
}
