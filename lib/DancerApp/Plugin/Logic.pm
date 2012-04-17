package DancerApp::Plugin::Logic;

BEGIN {
    $Dancer::Plugin::Logic::VERSION = '0.1';
}

use strict;
use warnings;
use Dancer qw(:syntax);
use Dancer::Plugin;
use DancerApp::Model;

my $model;
sub model {
    $model = DancerApp::Model->new unless $model;
}

register logic => sub {
    my $class_name = shift;
    die 'not specified logic name.' unless $class_name;
    my $package = 'DancerApp::Logic::' . $class_name;

    eval "use $package";
    my $class = $package->new;
    $class->log(DancerApp::Plugin::Logger->new);
    $class->schema(model);

    return $class;
};

register_plugin;

package DancerApp::Plugin::Logger;
use Dancer::Logger;

sub new {bless {}, shift;}

sub debug {shift; goto &Dancer::Logger::debug;}
sub info {shift; goto &Dancer::Logger::info;}
sub error {shift; goto &Dancer::Logger::error;}
sub warning {shift; goto &Dancer::Logger::warning;}

1;
