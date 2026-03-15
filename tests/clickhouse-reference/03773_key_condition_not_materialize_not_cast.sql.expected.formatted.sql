CREATE TABLE t_cast_bug
(
    val UInt8
)
ENGINE = MergeTree
ORDER BY val
SETTINGS add_minmax_index_for_numeric_columns = 0;

SELECT val
FROM t_cast_bug
WHERE NOT CAST(val = 0, 'UInt8')
ORDER BY val ASC;

CREATE TABLE t_materialize_bug
(
    val UInt8
)
ORDER BY (val)
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE VIEW v
AS
SELECT
    val,
    val = 0 AS is_zero
FROM t_materialize_bug;

SELECT val
FROM v
WHERE NOT is_zero
ORDER BY val ASC;