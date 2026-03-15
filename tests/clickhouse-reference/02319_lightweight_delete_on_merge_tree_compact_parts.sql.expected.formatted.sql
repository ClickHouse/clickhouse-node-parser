CREATE TABLE merge_table_standard_delete
(
    id Int32,
    name String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 10000000;

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

CREATE TABLE t_large
(
    a UInt32,
    b int
)
ENGINE = MergeTree
ORDER BY a
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT *
FROM t_large
WHERE a IN (1, 1000, 1005, 50000)
ORDER BY a ASC;