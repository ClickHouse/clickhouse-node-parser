-- Tags: memory-engine
SET create_table_empty_primary_key_by_default = 0;

SET default_table_engine = 'None';

CREATE TABLE table_02184
(
    x UInt8
); --{serverError ENGINE_REQUIRED}

SET default_table_engine = 'Log';

SYSTEM DROP  TABLE table_02184;

SET default_table_engine = 'MergeTree';

CREATE TABLE table_02184
(
    x UInt8,
    PRIMARY KEY(x)
);

CREATE TABLE test_optimize_exception
(
    date Date
)
ORDER BY date
PARTITION BY toYYYYMM(date);

SYSTEM DROP  TABLE test_optimize_exception;

CREATE TABLE table_02184
(
    x UInt8
)
PARTITION BY x; --{serverError BAD_ARGUMENTS}

CREATE TABLE table_02184
(
    x UInt8
)
ORDER BY x;

CREATE TABLE table_02184
(
    x UInt8
)
PRIMARY KEY x;

SET default_table_engine = 'Memory';

CREATE TABLE numbers1 AS
SELECT number
FROM numbers(10);

SELECT avg(number)
FROM numbers1;

SYSTEM DROP  TABLE numbers1;

CREATE TABLE numbers2
ORDER BY intHash32(number)
SAMPLE BY intHash32(number) AS
SELECT number
FROM numbers(10);

SELECT sum(number)
FROM numbers2;

SYSTEM DROP  TABLE numbers2;

CREATE TABLE numbers3
ENGINE = Log AS
SELECT number
FROM numbers(10);

SELECT sum(number)
FROM numbers3;

SYSTEM DROP  TABLE numbers3;

CREATE TABLE test_table
(
    EventDate Date,
    CounterID UInt32,
    UserID UInt64,
    EventTime DateTime('America/Los_Angeles'),
    UTCEventTime DateTime('UTC')
)
PRIMARY KEY CounterID
PARTITION BY EventDate;

CREATE MATERIALIZED VIEW test_view
(
    `Rows` UInt64,
    MaxHitTime DateTime('America/Los_Angeles')
)
AS
SELECT
    count() AS `Rows`,
    max(UTCEventTime) AS MaxHitTime
FROM test_table;

CREATE MATERIALIZED VIEW test_view_filtered
(
    EventDate Date,
    CounterID UInt32
)
POPULATE
AS
SELECT
    CounterID,
    EventDate
FROM test_table
WHERE EventDate < '2013-01-01';

INSERT INTO test_table (EventDate, UTCEventTime);

SELECT *
FROM test_table;

SELECT *
FROM test_view;

SELECT *
FROM test_view_filtered;

SYSTEM DROP  TABLE test_view;

SYSTEM DROP  TABLE test_view_filtered;

CREATE MATERIALIZED VIEW test_view
ORDER BY `Rows`
AS
SELECT
    count() AS `Rows`,
    max(UTCEventTime) AS MaxHitTime
FROM test_table;

CREATE TABLE t1 AS test_view;

CREATE TABLE t2 AS test_view
ENGINE = Memory;

SYSTEM DROP  TABLE test_table;

SYSTEM DROP  TABLE t1;

SYSTEM DROP  TABLE t2;

CREATE DATABASE test_02184
ORDER BY kek; -- {serverError UNKNOWN_ELEMENT_IN_AST}

CREATE DATABASE test_02184
SETTINGS x = 1; -- {serverError UNKNOWN_SETTING}

CREATE TABLE mt
(
    a UInt64,
    b Nullable(String),
    INDEX b_index b TYPE set(123) GRANULARITY 1,
    PRIMARY KEY(a, coalesce(b, 'test'))
);

CREATE TABLE mt2 AS mt;

SYSTEM DROP  TABLE mt;

CREATE TEMPORARY TABLE tmp
(
    n int
);

CREATE TEMPORARY TABLE tmp1
(
    n int
)
ENGINE = Memory;

CREATE TEMPORARY TABLE tmp2
(
    n int
)
ENGINE = Log;

CREATE TEMPORARY TABLE tmp2
(
    n int
)
ORDER BY n; -- {serverError BAD_ARGUMENTS}

CREATE TEMPORARY TABLE tmp2
(
    n int,
    PRIMARY KEY(n)
); -- {serverError BAD_ARGUMENTS}

CREATE TABLE log
(
    n int
);

CREATE TABLE log1 AS log;

CREATE TABLE mem AS log1
ENGINE = Memory;

SYSTEM DROP  TABLE log;

SYSTEM DROP  TABLE log1;

SYSTEM DROP  TABLE mem;

CREATE TABLE mem AS
SELECT 1 AS n; --{serverError ENGINE_REQUIRED}

CREATE TABLE mem
ORDER BY n AS
SELECT 1 AS n; -- {serverError BAD_ARGUMENTS}

CREATE TABLE mt
ORDER BY n AS
SELECT 1 AS n;

CREATE TABLE mem
ENGINE = Memory AS
SELECT 1 AS n;

CREATE TABLE val AS values('n int', 1, 2);

CREATE TABLE val2 AS val;

CREATE TABLE log AS val
ENGINE = Log;

SYSTEM DROP  TABLE val;

SYSTEM DROP  TABLE val2;

SYSTEM DROP  TABLE IF EXISTS kek;

SYSTEM DROP  TABLE IF EXISTS lol;

CREATE TABLE kek
(
    n int
)
SETTINGS log_queries = 1;

CREATE TABLE lol
(
    n int
)
ENGINE = MergeTree
ORDER BY n
SETTINGS min_bytes_for_wide_part = 123
SETTINGS log_queries = 1;

SYSTEM DROP  TABLE kek;

SYSTEM DROP  TABLE lol;

SET default_temporary_table_engine = 'Log';

CREATE TEMPORARY TABLE tmp_log
(
    n int
);