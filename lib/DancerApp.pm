package DancerApp;
use Dancer2;
use Dancer2::Plugin::Database;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'DancerApp' };
};

get '/:id' => sub {
    content_type("application/json");

    # my $sth = database->prepare(
    #     'SELECT * FROM notes WHERE id = ?',
    # );
    # $sth->execute(params->{id});
    
    return to_json(database->quick_select('Notes', { Id => params->{id} }));
};

true;
