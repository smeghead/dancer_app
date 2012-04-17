package DancerApp::Model::Schema;
use base qw/DBIx::Skinny::Schema::Loader/;
use DBIx::Skinny::InflateColumn::DateTime::Auto;

__PACKAGE__->load_schema;

1;

__END__

CREATE TABLE entries (
  id integer primary key not null,
  title varchar,
  category_id integer,
  created_at datetime,
  updated_at datetime
);
CREATE TABLE categories (
  id integer primary key not null,
  name varchar,
  created_at datetime,
  updated_at datetime
);
insert into categories (name, created_at, updated_at) values ('dance', current_datetime, current_datetime);
insert into categories (name, created_at, updated_at) values ('xslate', current_datetime, current_datetime);
insert into categories (name, created_at, updated_at) values ('skinny', current_datetime, current_datetime);
