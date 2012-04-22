package DancerApp::Controller::User;
use Dancer ':syntax';
use Dancer::Plugin::ValidateTiny;
use Dancer::Plugin::I18N;
use DancerApp::Plugin::FlashMessage;
use DancerApp::Plugin::Logic;

use Data::Dumper;

get '/' => sub {
    my $logic = logic('User');
    my $rows = $logic->all_users;
    template 'user/index', {rows => $rows};
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
        flash_errors $validation->{result};
        return forward '/user/add', {}, {method => 'GET'};
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

get '/edit/:id' => sub {
    my $id = param 'id';
    my $logic = logic('User');
    my $user_types = $logic->user_types;

    my $user = $logic->find($id);
    die 'failed to find user.' unless $user;

    template 'user/add', {
        user_types => $user_types,
        user => $user,
    };
};

post '/edit/:id' => sub {
    my $id = param 'id';
    my $params = params;
    my $logic = logic('User');

    # validation
    my $validation = validator $params, 'user.pl';
    unless ($validation->{valid}) {
        flash_errors $validation->{result};
        return forward '/user/edit/' . $id, {}, {method => 'GET'};
    }

    my $user = {
        name => $validation->{'result'}->{'name'},
        email => $validation->{'result'}->{'email'},
        user_type_id => $validation->{'result'}->{'user_type_id'},
    };
    my $updated_user = $logic->update($id, $user);
    die 'failed updated user.', $@ unless $updated_user;

    flash message => 'user updated.';
    redirect 'user/';
};
1;
