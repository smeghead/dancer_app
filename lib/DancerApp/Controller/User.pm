package DancerApp::Controller::User;
use Dancer ':syntax';
use DancerApp::Plugin::Logic;

get '/' => sub {
    my $user = logic('User');
    my $rows = $user->all_users;
    template 'user/list', {rows => $rows};
};

get '/add' => sub {
    my $user = logic('User');
    my $user_types = $user->user_types;
    template 'user/add', {user_types => $user_types};
};

1;
