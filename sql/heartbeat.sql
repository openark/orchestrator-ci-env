create table if not exists heartbeat (
  id int primary key,
  ts timestamp(6) not null
);
