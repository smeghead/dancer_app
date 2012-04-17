package DancerApp::Controller::Root;
use Dancer ':syntax';
use DancerApp::Plugin::Logic;

use Data::Dumper;
#use DancerApp::Logic::User;

get '/' => sub {
    my $user = logic('User');
    my $rows = $user->test_log;
    template 'index', {rows => $rows};
};

true;
