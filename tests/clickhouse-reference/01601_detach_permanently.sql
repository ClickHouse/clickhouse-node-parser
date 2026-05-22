-- Tags: no-parallel, log-engine

SET send_logs_level = 'fatal';
DROP DATABASE IF EXISTS test1601_detach_permanently_atomic;
CREATE DATABASE test1601_detach_permanently_atomic Engine=Atomic;
create table test1601_detach_permanently_atomic.test_name_reuse (number UInt64) engine=MergeTree order by tuple();
INSERT INTO test1601_detach_permanently_atomic.test_name_reuse SELECT * FROM numbers(100);
DETACH table test1601_detach_permanently_atomic.test_name_reuse PERMANENTLY;
DETACH table test1601_detach_permanently_atomic.test_name_reuse; -- { serverError UNKNOWN_TABLE }
drop table test1601_detach_permanently_atomic.test_name_reuse; -- { serverError UNKNOWN_TABLE }
create table test1601_detach_permanently_atomic.test_name_rename_attempt (number UInt64) engine=MergeTree order by tuple();
RENAME TABLE test1601_detach_permanently_atomic.test_name_rename_attempt TO test1601_detach_permanently_atomic.test_name_reuse; -- { serverError TABLE_ALREADY_EXISTS }
EXCHANGE TABLES test1601_detach_permanently_atomic.test_name_rename_attempt AND test1601_detach_permanently_atomic.test_name_reuse; -- { serverError UNKNOWN_TABLE }
SHOW CREATE TABLE test1601_detach_permanently_atomic.test_name_reuse FORMAT Vertical;
-- STD_EXCEPTION occured when running flaky test, the table directory's access right was removed. Refer `DatabaseCatalog::maybeRemoveDirectory`.
ATTACH TABLE test1601_detach_permanently_atomic.test_name_reuse UUID '00000000-0000-0000-0000-000000001601'　(`number` UInt64　)　ENGINE = MergeTree　ORDER BY tuple()　SETTINGS index_granularity = 8192 ;  -- { serverError TABLE_ALREADY_EXISTS, STD_EXCEPTION }
ATTACH TABLE test1601_detach_permanently_atomic.test_name_reuse;
SELECT count() FROM test1601_detach_permanently_atomic.test_name_reuse;
DETACH DATABASE test1601_detach_permanently_atomic;
ATTACH DATABASE test1601_detach_permanently_atomic;
DROP DATABASE test1601_detach_permanently_atomic SYNC;
SELECT '-----------------------';
DROP DATABASE IF EXISTS test1601_detach_permanently_ordinary;
set allow_deprecated_database_ordinary=1;
-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE test1601_detach_permanently_ordinary Engine=Ordinary;
create table test1601_detach_permanently_ordinary.test_name_reuse (number UInt64) engine=MergeTree order by tuple();
INSERT INTO test1601_detach_permanently_ordinary.test_name_reuse SELECT * FROM numbers(100);
DETACH table test1601_detach_permanently_ordinary.test_name_reuse PERMANENTLY;
DETACH table test1601_detach_permanently_ordinary.test_name_reuse; -- { serverError UNKNOWN_TABLE }
drop table test1601_detach_permanently_ordinary.test_name_reuse; -- { serverError UNKNOWN_TABLE }
create table test1601_detach_permanently_ordinary.test_name_rename_attempt (number UInt64) engine=MergeTree order by tuple();
RENAME TABLE test1601_detach_permanently_ordinary.test_name_rename_attempt TO test1601_detach_permanently_ordinary.test_name_reuse; -- { serverError TABLE_ALREADY_EXISTS }
SHOW CREATE TABLE test1601_detach_permanently_ordinary.test_name_reuse FORMAT Vertical;
ATTACH TABLE test1601_detach_permanently_ordinary.test_name_reuse (`number` UInt64　)　ENGINE = MergeTree　ORDER BY tuple()　SETTINGS index_granularity = 8192;
ATTACH TABLE test1601_detach_permanently_ordinary.test_name_reuse;
DETACH DATABASE test1601_detach_permanently_ordinary;
ATTACH DATABASE test1601_detach_permanently_ordinary;
DROP DATABASE test1601_detach_permanently_ordinary; -- { serverError DATABASE_NOT_EMPTY }
