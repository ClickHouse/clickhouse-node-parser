CREATE TABLE t
(
    n int,
    a Int64,
    s String
)
ENGINE = MergeTree()
ORDER BY a;

SET enable_positional_arguments = 0;

SET optimize_trivial_insert_select = 1;

SET max_rows_to_read = 0;

SELECT
    n,
    a,
    s
FROM t
ORDER BY n ASC;