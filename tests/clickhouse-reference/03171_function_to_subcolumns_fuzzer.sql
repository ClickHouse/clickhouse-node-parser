SELECT sum(mapContains(m, toNullable('aaa'))) FROM t_func_to_subcolumns_map_2;
SELECT
    id,
    right.n IS NULL
FROM t_func_to_subcolumns_join AS left
FULL OUTER JOIN
(
    SELECT
        1 AS id,
        'qqq' AS n
    UNION ALL
    SELECT
        3 AS id,
        'www'
) AS right USING (id)
WHERE empty(arr)
ORDER BY id;
SELECT length(arr) AS n, sum(v) FROM t_func_to_subcolumns_use_nulls GROUP BY n WITH ROLLUP HAVING n <= 4 OR isNull(n) ORDER BY n SETTINGS group_by_use_nulls = 1;
