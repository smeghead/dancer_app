package DancerApp::Controller::Root;
use Dancer ':syntax';
use DancerApp::Plugin::Logic;

get '/' => sub {
    template 'index';
};

1;
