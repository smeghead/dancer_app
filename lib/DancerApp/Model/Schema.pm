package DancerApp::Model::Schema;
use base qw/DBIx::Skinny::Schema::Loader/;
use DBIx::Skinny::InflateColumn::DateTime::Auto;

__PACKAGE__->load_schema;

1;

__END__

CREATE TABLE users (
  id integer primary key not null,
  name varchar,
  email varchar,
  user_type_id integer,
  created_at datetime,
  updated_at datetime
);
insert into users (name, email, user_type_id, created_at, updated_at)
values ('Jack Shephard', 'jack@example.com', 3, current_timestamp, current_timestamp);

CREATE TABLE user_types (
  id integer primary key not null,
  name varchar,
  created_at datetime,
  updated_at datetime
);
insert into user_types (name, created_at, updated_at) values ('normal', current_timestamp, current_timestamp);
insert into user_types (name, created_at, updated_at) values ('premium', current_timestamp, current_timestamp);
insert into user_types (name, created_at, updated_at) values ('administrator', current_timestamp, current_timestamp);
