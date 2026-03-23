-- Tags: no-parallel
SET send_logs_level = 'fatal';
drop database if exists db_hang;
drop database if exists db_hang_temp;
set allow_deprecated_database_ordinary=1;
-- Creation of a database with Ordinary engine emits a warning.
create database db_hang engine=Ordinary;
use db_hang;
create table db_hang.test(A Int64) Engine=MergeTree order by A;
create materialized view db_hang.test_mv(A Int64) Engine=MergeTree order by A as select * from db_hang.test;
insert into db_hang.test select * from numbers(1000);
create database db_hang_temp engine=Atomic;
drop database db_hang;
select count() from db_hang.test;
select count() from db_hang.test_mv;
