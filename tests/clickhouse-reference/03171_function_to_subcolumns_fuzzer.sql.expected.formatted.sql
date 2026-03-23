SET optimize_functions_to_subcolumns = 1;

SET enable_analyzer = 1;

CREATE TABLE t_func_to_subcolumns_map_2
(
    id UInt64,
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_func_to_subcolumns_map_2;

SELECT sum(mapContains(m, toNullable('aaa')))
FROM t_func_to_subcolumns_map_2;

CREATE TABLE t_func_to_subcolumns_join
(
    id UInt64,
    arr Array(UInt64),
    n Nullable(String),
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t_func_to_subcolumns_join;

SET join_use_nulls = 1;

SELECT
    id,
    isNull(`right`.n)
FROM
    t_func_to_subcolumns_join AS `left`
FULL JOIN (
        SELECT
            1 AS id,
            'qqq' AS n
        UNION ALL
        SELECT
            3 AS id,
            'www'
    ) AS `right`
    USING (id)
WHERE empty(arr)
ORDER BY id ASC;

CREATE TABLE t_func_to_subcolumns_use_nulls
(
    arr Array(UInt64),
    v UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t_func_to_subcolumns_use_nulls SELECT
    range(number % 10),
    number
FROM numbers(100);

SELECT
    length(arr) AS n,
    sum(v)
FROM t_func_to_subcolumns_use_nulls
GROUP BY n
WITH ROLLUP
HAVING n <= 4
    OR isNull(n)
ORDER BY n ASC
SETTINGS group_by_use_nulls = 1;