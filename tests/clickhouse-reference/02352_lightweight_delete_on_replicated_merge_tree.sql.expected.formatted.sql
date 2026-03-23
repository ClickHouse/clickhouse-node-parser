-- Tags: long
SYSTEM DROP  TABLE IF EXISTS replicated_table_r1 SYNC;

SYSTEM DROP  TABLE IF EXISTS replicated_table_r2 SYNC;

CREATE TABLE replicated_table_r1
(
    id Int32,
    name String
)
ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_rep', '1')
ORDER BY id;

CREATE TABLE replicated_table_r2
(
    id Int32,
    name String
)
ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_rep', '2')
ORDER BY id;

INSERT INTO replicated_table_r1 SELECT
    number,
    toString(number)
FROM numbers(100);

SET mutations_sync = 0;

SELECT COUNT()
FROM replicated_table_r1;

SELECT COUNT()
FROM replicated_table_r2;

SYSTEM DROP  TABLE IF EXISTS t_light_r1 SYNC;

SYSTEM DROP  TABLE IF EXISTS t_light_r2 SYNC;

CREATE TABLE t_light_r1
(
    a int,
    b int,
    c int,
    INDEX i_c b TYPE minmax GRANULARITY 4
)
ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_light', '1')
ORDER BY a
PARTITION BY c % 5;

CREATE TABLE t_light_r2
(
    a int,
    b int,
    c int,
    INDEX i_c b TYPE minmax GRANULARITY 4
)
ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_light', '2')
ORDER BY a
PARTITION BY c % 5;

INSERT INTO t_light_r1 SELECT
    number,
    number,
    number
FROM numbers(10);

SELECT '-----Check that select and merge with lightweight delete.-----';

SELECT count(*)
FROM t_light_r1;

SELECT *
FROM t_light_r1
ORDER BY a ASC;

SELECT *
FROM t_light_r2
ORDER BY a ASC;

CREATE TABLE t_light_sync_r1
(
    a int,
    b int,
    c int,
    INDEX i_c b TYPE minmax GRANULARITY 4
)
ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_sync', '1')
ORDER BY a
PARTITION BY c % 5
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO t_light_sync_r1 SELECT
    number,
    number,
    number
FROM numbers(10);

CREATE TABLE t_light_sync_r2
(
    a int,
    b int,
    c int,
    INDEX i_c b TYPE minmax GRANULARITY 4
)
ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_sync', '2')
ORDER BY a
PARTITION BY c % 5
SETTINGS min_bytes_for_wide_part = 0;

SELECT *
FROM t_light_sync_r2
ORDER BY a ASC;

SYSTEM DROP  TABLE IF EXISTS t_light_sync_r1 SYNC;

SYSTEM DROP  TABLE IF EXISTS t_light_sync_r2 SYNC;