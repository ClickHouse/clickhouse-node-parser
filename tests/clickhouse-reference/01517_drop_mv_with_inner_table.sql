-- Tags: no-parallel

SET send_logs_level = 'fatal';
create database db_01517_atomic Engine=Atomic;
create table db_01517_atomic.source (key Int) engine=Null;
create materialized view db_01517_atomic.mv engine=Null as select * from db_01517_atomic.source;
create database db_01517_atomic_sync Engine=Atomic;
create table db_01517_atomic_sync.source (key Int) engine=Null;
create materialized view db_01517_atomic_sync.mv engine=Null as select * from db_01517_atomic_sync.source;
set allow_deprecated_database_ordinary=1;
-- Creation of a database with Ordinary engine emits a warning.
create database db_01517_ordinary Engine=Ordinary;
create table db_01517_ordinary.source (key Int) engine=Null;
create materialized view db_01517_ordinary.mv engine=Null as select * from db_01517_ordinary.source;
