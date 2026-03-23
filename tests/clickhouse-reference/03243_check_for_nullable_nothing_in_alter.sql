drop table if exists src;
drop table if exists dst;
drop view if exists v;
create table src (x Nullable(Int32)) engine=Memory;
create table dst (x Nullable(Int32)) engine=Memory;
create materialized view v to dst as select x from src;
drop view v;
drop table dst;
drop table src;
