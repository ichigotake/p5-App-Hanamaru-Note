### common config
use utf8;
+{
    appname => 'はなまる手帳',
    "Plugin::Teng" => {
        connect_info => [
            'dbi:SQLite:dbname=hanamaru.db', '', '',
            {
                sqlite_unicode => 1,
            },
        ],
        plugins => [qw/Pager/],
    },
};
