package Hanamaru;
use strict;
use warnings;
use utf8;
use Time::Piece;
use Nephia plugins => [
    'View::MicroTemplate' => {
        include_path => [qw/ view /],
    },
    'Dispatch',
    'Teng',
];

our $VERSION = '0.03';

app {
    get '/' => sub {

        [200, [], render('index.html', {
            title      => 'はなまる手帳',
            teng       => teng,
            parse_time => sub { return Time::Piece->new($_[0])->strftime($_[1]) },
        })];
    };

    post '/' => sub {
       if ( my $word = param('word') ) {
            my $impression = param('impression') || '';
            my $now = time;
            teng->insert('dictionary', {
                word => $word,
                impression => $impression,
                created_at => $now,
            });
        }
        [302, [ 'Location' => '/' ], undef]
    };
};

1;

=head1 NAME

Hanamaru - はなまる手帳

=head1 SYNOPSIS

  $ plackup

=head1 DESCRIPTION

Hanamaru is post to "Hanamaru word" web application.

"Hanamaru" mean "flower circle", its offen used praise children.

=head1 AUTHOR

ichigotake

=head1 SEE ALSO

Nephia

Google Image Search: "はなまる"

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

