package DancerApp::Logic::User;
use strict;
use warnings;
use base qw( DancerApp::Logic::Base );

use Data::Dumper;

sub user_types {
    my ($self) = @_;
    $self->log->debug('enter user_types');
    my @rows = $self->schema->search_by_sql(q{select * from user_types order by id asc});
    return \@rows;
}

sub all_users {
    my ($self) = @_;
    $self->log->debug('enter all_users');
    my @rows = $self->schema->search_by_sql(q{select u.*, t.name as user_type from users as u inner join user_types as t on t.id = u.user_type_id});
    return \@rows;
}

sub register {
    my ($self, $user) = @_;
    $self->log->debug('enter register');
    return $self->schema->insert('users', $user);
}

sub update {
    my ($self, $id, $user) = @_;
    $self->log->debug('enter update');
    die 'required param: id.' unless $id;

    return $self->schema->update('users', $user, {id => $id});
}

sub find {
    my ($self, $id) = @_;
    $self->log->debug('enter find');
    return $self->schema->single('users', {id => $id});
}

1;
