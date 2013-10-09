requires 'Nephia' => '0.80';
requires 'Config::Micro' => '0.02';
requires 'Nephia::Plugin::Teng';
requires 'Nephia::Plugin::View::MicroTemplate';
requires 'Nephia::Plugin::Dispatch';
requires 'DBD::SQLite';
recommends 'Starlet';

on test => sub {
    requires 'Test::More', '0.98';
};


