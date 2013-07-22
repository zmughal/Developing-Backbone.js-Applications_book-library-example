-- drop table books;
create table if not exists books (
  id integer primary key autoincrement,
  title string not null,
  author string,
  release_date integer,
  keywords string
);
