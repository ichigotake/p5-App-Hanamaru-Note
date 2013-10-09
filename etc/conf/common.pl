### common config
use utf8;
+{
    appname => 'はなまる手帳',
    'DBI' => {
        connect_info => [
            'dbi:SQLite:dbname=hanamaru.db', '', '',
            {
                sqlite_unicode => 1,
            },
        ],
        plugins => [qw/Pager/],
    },
};
