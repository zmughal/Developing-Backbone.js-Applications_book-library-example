package BookLibrary::API;
use Mojo::Base 'Mojolicious::Controller';

use strict;
use Path::Class;
use Try::Tiny;
use BookLibrary::Schema;
use BookLibrary::Helper;

has db => sub {
	my $sqlite_db = file(__FILE__)
		->parent->parent->parent->file('prod.db')
		->absolute;
	BookLibrary::Schema->connect('dbi:SQLite:dbname='.$sqlite_db);
};

sub all_books {
	my $self = shift;
	my $books = [ $self->db->resultset('Book')->all ];
	$self->render( json => $books );
}

sub get_book {
	my $self = shift;
	my $id = $self->param('id');
	try {
		my $book = $self->db->resultset('Book')->find($id);
		if($book) {
			$self->render( json => $book );
		} else {
			die "could not find book $id";
		}
	} catch {
			$self->render( json => { error => "book ID $id not found!" }, status => 500 );
	};
}

sub new_book {
	my $self = shift;
	my $data = $self->req->json;
	try {
		my $book = $self->db->resultset('Book')->create({
			title => $data->{title},
			( (author => $data->{author})x!! ( $data->{author} ) ),
			( (release_date => $data->{releaseDate})x!! ( $data->{releaseDate} ) ),
			( (keywords => $data->{keywords})x!! ( $data->{keywords} ) ),
		});
		if($book) {
			$self->render( json => $book );
		} else {
			die "database insert error";
		}
	} catch {
		$self->render( json => { error => "could not create book: $_" }, status => 500 );
	};
}

sub update_book {
	my $self = shift;
	my $id = $self->param('id');
	my $data = $self->req->json;
	try {
		my $book = $self->db->resultset('Book')->find($id);
		if($book) {
			$self->render( json => $book );
		} else {
			die "could not find book $id";
		}
		$book->update({
			(title => $data->{title})x!! $data->{title},
			(author => $data->{author})x!! $data->{author},
			(release_date => $data->{releaseDate})x!! $data->{releaseDate},
			(keywords => $data->{keywords})x!! $data->{keywords},
		});
	} catch {
			$self->render( json => { error => "error updating book ID $id: $_" }, status => 500 );
	};
}

sub delete_book {
	my $self = shift;
	my $id = $self->param('id');
	try {
		my $book = $self->db->resultset('Book')->find($id);
		if($book) {
			$book->delete;
			$self->render( json => [] );
		} else {
			die "could not find book $id";
		}
	} catch {
			$self->render( json => { error => "error deleting book ID $id: $_" }, status => 500 );
	};

}

1;
