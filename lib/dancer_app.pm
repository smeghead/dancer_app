package dancer_app;
use Dancer ':syntax';
# use Dancer::Plugin::I18N;

our $VERSION = '0.1';

# languages( ['ja'] );

load_app 'DancerApp/Controller/Root', prefix => '/';
load_app 'DancerApp/Controller/User', prefix => '/user';

true;
