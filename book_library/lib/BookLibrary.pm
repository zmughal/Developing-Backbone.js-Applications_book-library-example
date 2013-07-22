package BookLibrary;
use Mojo::Base 'Mojolicious';

use strict;

use BookLibrary::API;

# This method will run once at server start
sub startup {
	my $self = shift;

	# Router
	my $r = $self->routes;

	$r->route('/')->to( cb => sub { shift->render_static('index.html') });

	my $api = $r->under('/api');

	#my @id_match = ( id =>  qr/\d+/ ); # id parameter must be a number
	my @id_match = ();
	# Normal route to controller
	# url             HTTP Method  Operation
	# /api/books      GET          Get an array of all books
	$api->route('/books', @id_match)->via('GET')->to('API#all_books');
	# /api/books/:id  GET          Get the book with id of :id
	$api->route('/books/:id', @id_match)->via('GET')->to('API#get_book');
	# /api/books      POST         Add a new book and return the book with an id attribute added
	$api->route('/books', @id_match)->via('POST')->to('API#new_book');
	# /api/books/:id  PUT          Update the book with id of :id
	$api->route('/books/:id', @id_match)->via('PUT')->to('API#update_book');
	# /api/books/:id  DELETE       Delete the book with id of :id
	$api->route('/books/:id', @id_match)->via('DELETE')->to('API#delete_book');
}

1;
