use utf8;
package BookLibrary::Schema::Result::Book;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BookLibrary::Schema::Result::Book

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<books>

=cut

__PACKAGE__->table("books");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'string'
  is_nullable: 0

=head2 author

  data_type: 'string'
  is_nullable: 1

=head2 release_date

  data_type: 'integer'
  is_nullable: 1

=head2 keywords

  data_type: 'string'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "string", is_nullable => 0 },
  "author",
  { data_type => "string", is_nullable => 1 },
  "release_date",
  { data_type => "integer", is_nullable => 1 },
  "keywords",
  { data_type => "string", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-22 02:07:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mGIaUZToD843dcaRE/q4Gg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
