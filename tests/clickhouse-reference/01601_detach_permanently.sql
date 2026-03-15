-- Tags: no-parallel, log-engine

SET send_logs_level = 'fatal';
CREATE DATABASE test1601_detach_permanently_atomic Engine=Atomic;
create table test1601_detach_permanently_atomic.test_name_reuse (number UInt64) engine=MergeTree order by tuple();
create table test1601_detach_permanently_atomic.test_name_rename_attempt (number UInt64) engine=MergeTree order by tuple();
SELECT count() FROM test1601_detach_permanently_atomic.test_name_reuse;
SELECT '-----------------------';
set allow_deprecated_database_ordinary=1;
-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE test1601_detach_permanently_ordinary Engine=Ordinary;
create table test1601_detach_permanently_ordinary.test_name_reuse (number UInt64) engine=MergeTree order by tuple();
create table test1601_detach_permanently_ordinary.test_name_rename_attempt (number UInt64) engine=MergeTree order by tuple();
