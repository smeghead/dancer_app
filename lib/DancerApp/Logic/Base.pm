package DancerApp::Logic::Base;
use strict;
use warnings;
use base qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors(qw{ schema log });

1;
