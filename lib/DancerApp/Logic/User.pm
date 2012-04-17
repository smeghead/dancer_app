package DancerApp::Logic::User;
use strict;
use warnings;
use base qw( DancerApp::Logic::Base );

use Data::Dumper;

sub test_log {
    my ($self) = @_;
    $self->log->debug('hogehoge');
    $self->schema->insert('entries', {
        title => 'test1',
        category_id => 1,
    });
    my @rows = $self->schema->search_by_sql(q{select e.*, c.name as category_name from entries as e inner join categories as c on c.id = e.category_id});
    $self->log->debug(Dumper(\@rows));
    return \@rows;
}

1;

