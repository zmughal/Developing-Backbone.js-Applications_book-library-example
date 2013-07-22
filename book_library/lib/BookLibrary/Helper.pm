package BookLibrary::Helper;

use strict;
use warnings;
use BookLibrary::Schema;

sub BookLibrary::Schema::Result::Book::TO_JSON {
	my ($self) = @_;
	return {
		id => $self->id,
		title => $self->title,
		author => $self->author,
		releaseDate => $self->release_date,
		keywords => $self->keywords,
	}
}


1;
