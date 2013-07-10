package Hanamaru;
use strict;
use warnings;
use Nephia plugins => [qw/Teng/];
use Time::Piece;

our $VERSION = 0.01;

path '/' => sub {
    my $req = shift;

    if ( my $word = $req->param('word') ) {
        my $impression = $req->param('impression') || '';
        my $now = time;
        teng->insert('dictionary', {
            word => $word,
            impression => $impression,
            created_at => $now,
        });
        return res { redirect('/') };
    }

    return {
        template => 'index.html',
        title    => config->{appname},
        teng     => teng,
        parse_time => sub { return Time::Piece->new($_[0])->strftime($_[1]) },
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

