SET replication_alter_partitions_sync = 2;

DROP TABLE IF EXISTS clear_column;

CREATE TABLE clear_column
(
    d Date,
    num Int64,
    str String
)
ENGINE = MergeTree
ORDER BY d
PARTITION BY toYYYYMM(d)
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO clear_column;

SELECT data_uncompressed_bytes
FROM `system`.`columns`
WHERE (database = currentDatabase())
    AND (table = 'clear_column')
    AND (name = 'num');

SELECT
    num,
    str
FROM clear_column
ORDER BY num ASC;

SELECT
    data_compressed_bytes,
    data_uncompressed_bytes
FROM `system`.`columns`
WHERE (database = currentDatabase())
    AND (table = 'clear_column')
    AND (name = 'num');

DROP TABLE clear_column;

DROP TABLE IF EXISTS clear_column1;

DROP TABLE IF EXISTS clear_column2;

SELECT sleep(1)
FORMAT Null;

CREATE TABLE clear_column1
(
    d Date,
    i Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_00446/tables/clear_column', '1')
ORDER BY d
PARTITION BY toYYYYMM(d)
SETTINGS min_bytes_for_wide_part = 0;

CREATE TABLE clear_column2
(
    d Date,
    i Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_00446/tables/clear_column', '2')
ORDER BY d
PARTITION BY toYYYYMM(d)
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO clear_column1 (d);

SET replication_alter_partitions_sync = 2;

INSERT INTO clear_column1;

INSERT INTO clear_column1;

SELECT *
FROM clear_column2
ORDER BY
    d ASC,
    i ASC,
    s ASC;

SELECT DISTINCT *
FROM clear_column2
ORDER BY
    d ASC,
    i ASC,
    s ASC;

SELECT sum(data_uncompressed_bytes)
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND like(table, 'clear_column_')
    AND ((name = 'i'
    OR name = 's'))
GROUP BY table;

SET optimize_throw_if_noop = 1;

DROP TABLE clear_column1;

DROP TABLE clear_column2;