package BookLibrary;
use Mojo::Base 'Mojolicious';

use strict;

# This method will run once at server start
sub startup {
	my $self = shift;

	# Router
	my $r = $self->routes;

	# Normal route to controller
	# url             HTTP Method  Operation
	# /api/books      GET          Get an array of all books
	$r->get('/api/books')->to('api#all_books');
	# /api/books/:id  GET          Get the book with id of :id
	$r->get('/api/books/:id')->to('api#get_book');
	# /api/books      POST         Add a new book and return the book with an id attribute added
	$r->post('/api/books/:id')->to('api#new_book');
	# /api/books/:id  PUT          Update the book with id of :id
	$r->put('/api/books/:id')->to('api#update_book');
	# /api/books/:id  DELETE       Delete the book with id of :id
	$r->delete('/api/books/:id')->to('api#delete_book');
}

1;
