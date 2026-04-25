package DancerApp;
use Dancer2;
use Dancer2::Plugin::Database;

use strict;
use warnings;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'DancerApp' };
};

get '/search' => sub {
    my $query = query_parameters->get('note-name');

    my $sth = database->prepare(
    'SELECT "Id", "Title" FROM "Notes" WHERE "Title" LIKE \'%\' || :query || \'%\'',
    );
    $sth->bind_param(':query', $query);

    $sth->execute;
    my @res = @{$sth->fetchall_arrayref};

    foreach my $elem (@res) {
        push(@$elem, uri_for_route('note-by-id', { id => $elem->[0] }));
    }

    template 'note-search' => {note_query => $query, notes => \@res};
};

get 'note-by-id' => '/:id' => sub {
    content_type("application/json");

    # my $sth = database->prepare(
    #     'SELECT * FROM notes WHERE id = ?',
    # );
    # $sth->execute(params->{id});
    
    return to_json(database->quick_select('Notes', { Id => params->{id} }));
};

true;
