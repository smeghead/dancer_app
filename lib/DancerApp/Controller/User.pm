package DancerApp::Controller::User;
use Dancer ':syntax';
use Dancer::Plugin::ValidateTiny;
use DancerApp::Plugin::FlashMessage;
use DancerApp::Plugin::Logic;

use Data::Dumper;

get '/' => sub {
    my $logic = logic('User');
    my $rows = $logic->all_users;
    template 'user/list', {rows => $rows};
};

get '/add' => sub {
    my $logic = logic('User');
    my $user_types = $logic->user_types;
    template 'user/add', {user_types => $user_types};
};

post '/add' => sub {
    my $params = params;
    my $logic = logic('User');

    # validation
    my $validation = validator $params, 'user.pl';
    unless ($validation->{valid}) {
        my $errors = $validation->{result};
        for my $m (keys %$errors) {
            next unless $m =~ m{^err_};
            flash $m => $errors->{$m};
        }
        my $user_types = $logic->user_types;
        return template 'user/add', {user_types => $user_types};
    }

    my $user = {
        name => $validation->{'result'}->{'name'},
        email => $validation->{'result'}->{'email'},
        user_type_id => $validation->{'result'}->{'user_type_id'},
    };
    my $new_user = $logic->register($user);
    die 'failed register user.', $@ unless $new_user;

    flash message => 'user created.';
    redirect 'user/';
};
1;
