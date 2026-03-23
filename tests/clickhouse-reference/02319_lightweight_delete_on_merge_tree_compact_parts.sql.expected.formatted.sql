DROP TABLE IF EXISTS merge_table_standard_delete;

CREATE TABLE merge_table_standard_delete
(
    id Int32,
    name String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 10000000;

INSERT INTO merge_table_standard_delete SELECT
    number,
    toString(number)
FROM numbers(100);

SELECT
    COUNT(),
    part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'merge_table_standard_delete'
    AND active
GROUP BY part_type
ORDER BY part_type ASC;

SET mutations_sync = 0;

SET check_query_single_value_result = 1;

SELECT COUNT()
FROM merge_table_standard_delete;

DROP TABLE merge_table_standard_delete;

DROP TABLE IF EXISTS t_light;

CREATE TABLE t_light
(
    a int,
    b int,
    c int,
    INDEX i_c b TYPE minmax GRANULARITY 4
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY c % 5
SETTINGS min_bytes_for_wide_part = 10000000;

INSERT INTO t_light SELECT
    number,
    number,
    number
FROM numbers(10);

SELECT
    COUNT(),
    part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_light'
    AND active
GROUP BY part_type
ORDER BY part_type ASC;

SELECT '-----lightweight mutation type-----';

ALTER TABLE t_light MATERIALIZE INDEX i_c SETTINGS mutations_sync = 2;

ALTER TABLE t_light UPDATE b = -1 WHERE a < 3 SETTINGS mutations_sync = 2;

ALTER TABLE t_light DROP INDEX i_c SETTINGS mutations_sync = 2;

SELECT
    command,
    is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_light';

SELECT count(*)
FROM t_light;

SELECT *
FROM t_light
ORDER BY a ASC;

SELECT
    table,
    `partition`,
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND active
    AND table = 't_light'
ORDER BY name ASC;

SELECT
    table,
    `partition`,
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND active
    AND table = 't_light'
    AND `rows` > 0
ORDER BY name ASC;

DROP TABLE t_light;

CREATE TABLE t_large
(
    a UInt32,
    b int
)
ENGINE = MergeTree
ORDER BY a
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO t_large SELECT
    number + 1,
    number + 1
FROM numbers(100000);

ALTER TABLE t_large UPDATE b = -2 WHERE and(greaterOrEquals(a, 1000), lessOrEquals(a, 1005)) SETTINGS mutations_sync = 2;

ALTER TABLE t_large DELETE WHERE a = 1 SETTINGS mutations_sync = 2;

SELECT *
FROM t_large
WHERE a IN (1, 1000, 1005, 50000)
ORDER BY a ASC;

DROP TABLE t_large;