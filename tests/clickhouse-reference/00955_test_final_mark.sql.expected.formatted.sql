-- Tags: no-random-merge-tree-settings
SET send_logs_level = 'fatal';

DROP TABLE IF EXISTS mt_with_pk;

CREATE TABLE mt_with_pk
(
    d Date DEFAULT '2000-01-01',
    x DateTime,
    y Array(UInt64),
    z UInt64,
    n Nested(Age UInt8, Name String),
    w Int16 DEFAULT 10
)
ENGINE = MergeTree()
ORDER BY (x, z)
PARTITION BY toYYYYMM(d)
SETTINGS index_granularity_bytes = 10000; -- write_final_mark=1 by default

INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`);

SELECT COUNT(*)
FROM mt_with_pk
WHERE x > toDateTime('2018-10-01 23:57:57');

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'mt_with_pk'
    AND database = currentDatabase()
    AND active = 1
    AND database = currentDatabase();

INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`);

INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`);

SELECT sum(w)
FROM mt_with_pk;

SELECT DISTINCT (y)
FROM mt_with_pk;

INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`, w);

SELECT COUNT(*)
FROM mt_with_pk
WHERE z + w > 5000;

DROP TABLE IF EXISTS alter_attach;

CREATE TABLE alter_attach
(
    x UInt64,
    p UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY p
SETTINGS index_granularity_bytes = 10000, write_final_mark = 1;

INSERT INTO alter_attach;

INSERT INTO alter_attach;

SELECT *
FROM alter_attach
ORDER BY x ASC;

INSERT INTO alter_attach;

DROP TABLE IF EXISTS alter_update_00806;

CREATE TABLE alter_update_00806
(
    d Date,
    e Enum8('foo' = 1, 'bar' = 2)
)
ENGINE = MergeTree
ORDER BY (d)
PARTITION BY d
SETTINGS index_granularity_bytes = 10000, write_final_mark = 1;

INSERT INTO alter_update_00806 (d, e);

INSERT INTO alter_update_00806 (d, e);

SELECT e
FROM alter_update_00806
ORDER BY d ASC;

DROP TABLE IF EXISTS mt_without_pk;

CREATE TABLE mt_without_pk
(
    d Date DEFAULT '2000-01-01',
    x DateTime,
    y Array(UInt64),
    z UInt64,
    n Nested(Age UInt8, Name String),
    w Int16 DEFAULT 10
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY toYYYYMM(d)
SETTINGS index_granularity_bytes = 10000, write_final_mark = 1;

INSERT INTO mt_without_pk (d, x, y, z, `n.Age`, `n.Name`);

SELECT COUNT(*)
FROM mt_without_pk
WHERE x > toDateTime('2018-10-01 23:57:57');

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'mt_without_pk'
    AND active = 1
    AND database = currentDatabase();

INSERT INTO mt_without_pk (d, x, y, z, `n.Age`, `n.Name`);

DROP TABLE IF EXISTS mt_with_small_granularity;

CREATE TABLE mt_with_small_granularity
(
    d Date DEFAULT '2000-01-01',
    x DateTime,
    y Array(UInt64),
    z UInt64,
    n Nested(Age UInt8, Name String),
    w Int16 DEFAULT 10
)
ENGINE = MergeTree()
ORDER BY (x, z)
PARTITION BY toYYYYMM(d)
SETTINGS index_granularity_bytes = 30, min_index_granularity_bytes = 20, write_final_mark = 1;

INSERT INTO mt_with_small_granularity (d, x, y, z, `n.Age`, `n.Name`);

SELECT COUNT(*)
FROM mt_with_small_granularity
WHERE x > toDateTime('2018-10-01 23:57:57');

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'mt_with_small_granularity'
    AND active = 1
    AND database = currentDatabase();

INSERT INTO mt_with_small_granularity (d, x, y, z, `n.Age`, `n.Name`);