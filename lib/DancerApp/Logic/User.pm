package DancerApp::Logic::User;
use strict;
use warnings;
use base qw( DancerApp::Logic::Base );

use Data::Dumper;

sub user_types {
    my ($self) = @_;
    $self->log->debug('enter user_types');
    my @rows = $self->schema->search_by_sql(q{select * from user_types order by id asc});
    $self->log->debug(Dumper(\@rows));
    return \@rows;
}

sub all_users {
    my ($self) = @_;
    $self->log->debug('enter all_users');
    my @rows = $self->schema->search_by_sql(q{select u.*, t.name as user_type from users as u inner join user_types as t on t.id = u.user_type_id});
    $self->log->debug(Dumper(\@rows));
    return \@rows;
}

sub register {
    my ($self, $h) = @_;
    $self->log->debug('enter register');
    return $self->schema->insert($h);
}

1;
