package BookLibrary::API;
use Mojo::Base 'Mojolicious::Controller';

use strict;
use BookLibrary::Schema;
use Path::Class;

has db => sub {
	my $sqlite_db = file(__FILE__)
		->parent->parent->parent->file('prod.db')
		->absolute;
	BookLibrary::Schema->connect('dbi:SQLite:dbname='.$sqlite_db);
};

sub all_books {
}

sub get_book {

}

sub new_book {

}

sub update_book {

}

sub delete_book {

}

1;
