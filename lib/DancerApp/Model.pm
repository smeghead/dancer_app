package DancerApp::Model;
use DBIx::Skinny connect_info => {
    dsn => 'dbi:SQLite:db/app.db',
    username => '',
    password => '',
};
1;
