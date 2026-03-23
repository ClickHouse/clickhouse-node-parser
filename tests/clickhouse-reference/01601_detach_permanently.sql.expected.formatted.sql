-- Tags: no-parallel, log-engine
SET send_logs_level = 'fatal';

DROP DATABASE IF EXISTS test1601_detach_permanently_atomic;

CREATE DATABASE test1601_detach_permanently_atomic
ENGINE = Atomic;

CREATE TABLE test1601_detach_permanently_atomic.test_name_reuse
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test1601_detach_permanently_atomic.test_name_reuse SELECT *
FROM numbers(100);

DROP TABLE test1601_detach_permanently_atomic.test_name_reuse; -- { serverError UNKNOWN_TABLE }

CREATE TABLE test1601_detach_permanently_atomic.test_name_rename_attempt
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count()
FROM test1601_detach_permanently_atomic.test_name_reuse;

DROP DATABASE test1601_detach_permanently_atomic;

SELECT '-----------------------';

DROP DATABASE IF EXISTS test1601_detach_permanently_ordinary;

SET allow_deprecated_database_ordinary = 1;

-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE test1601_detach_permanently_ordinary
ENGINE = Ordinary;

CREATE TABLE test1601_detach_permanently_ordinary.test_name_reuse
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test1601_detach_permanently_ordinary.test_name_reuse SELECT *
FROM numbers(100);

DROP TABLE test1601_detach_permanently_ordinary.test_name_reuse; -- { serverError UNKNOWN_TABLE }

CREATE TABLE test1601_detach_permanently_ordinary.test_name_rename_attempt
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

DROP DATABASE test1601_detach_permanently_ordinary; -- { serverError DATABASE_NOT_EMPTY }