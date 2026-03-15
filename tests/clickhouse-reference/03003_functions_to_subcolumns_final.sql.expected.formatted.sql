SET optimize_functions_to_subcolumns = 1;

SET enable_analyzer = 1;

SET optimize_on_insert = 0;

CREATE TABLE t_length_1
(
    id UInt64,
    arr Array(UInt64)
)
ENGINE = ReplacingMergeTree
ORDER BY id;

CREATE TABLE t_length_2
(
    id UInt64,
    arr_length UInt64
)
ENGINE = ReplacingMergeTree
ORDER BY id;

SELECT length(arr)
FROM t_length_1
WHERE length(arr) IN (
        SELECT arr_length
        FROM t_length_2
    );

SELECT length(arr)
FROM t_length_1
WHERE length(arr) IN (
        SELECT arr_length
        FROM t_length_2 FINAL
    );

SELECT length(arr)
FROM t_length_1 FINAL
WHERE length(arr) IN (
        SELECT arr_length
        FROM t_length_2 FINAL
    );