SET send_logs_level = 'fatal';

CREATE TABLE t_03291_collapsing_invalid_sign
(
    x int,
    sign Int8
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY x;

SET optimize_on_insert = 0;

-- Invalid sign does not show up in result of SELECT ... FINAL
SELECT *
FROM t_03291_collapsing_invalid_sign FINAL;

-- But it is still there
SELECT *
FROM t_03291_collapsing_invalid_sign
WHERE sign = 2;

-- From https://github.com/ClickHouse/ClickHouse/issues/70964
CREATE TABLE t0
(
    c0 Int64,
    c1 Int8
)
ENGINE = CollapsingMergeTree(c1)
ORDER BY tuple();

-- Should only show the last inserted row with valid sign
SELECT *
FROM t0 FINAL;

SELECT *
FROM t0;

CREATE TABLE t_03291_collapsing_invalid_sign_vertical_merge
(
    c0 Int64,
    c1 Int8
)
ENGINE = CollapsingMergeTree(c1)
ORDER BY tuple()
SETTINGS enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 0, vertical_merge_algorithm_min_bytes_to_activate = 0, vertical_merge_algorithm_min_columns_to_activate = 0, min_bytes_for_wide_part = 0;

CREATE TABLE t0
(
    c0 Int8,
    c1 Int
)
ENGINE = CollapsingMergeTree(c0)
ORDER BY c1;

SELECT 1
FROM t0 FINAL;