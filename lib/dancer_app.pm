package dancer_app;
use Dancer ':syntax';

our $VERSION = '0.1';

load_app 'DancerApp/Controller/Root', prefix => '/';
load_app 'DancerApp/Controller/User', prefix => '/user';

true;
