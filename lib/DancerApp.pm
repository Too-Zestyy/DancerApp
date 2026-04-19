package DancerApp;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'DancerApp' };
};

get '/hello-world' => sub {
    content_type("application/json");
    
    return to_json({'message' => 'Hello World!!'});
};

true;
