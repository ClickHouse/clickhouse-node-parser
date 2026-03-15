create table src (x Nullable(Int32)) engine=Memory;
create table dst (x Nullable(Int32)) engine=Memory;
create materialized view v to dst as select x from src;
