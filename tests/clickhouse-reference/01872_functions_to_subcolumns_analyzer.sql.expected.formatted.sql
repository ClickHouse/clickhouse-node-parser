SELECT
    isNull(id),
    isNull(n),
    isNotNull(n)
FROM t_func_to_subcolumns
ORDER BY id ASC;

SELECT
    length(arr),
    empty(arr),
    notEmpty(arr),
    empty(n)
FROM t_func_to_subcolumns
ORDER BY id ASC;

SELECT
    mapKeys(m),
    mapValues(m)
FROM t_func_to_subcolumns
ORDER BY id ASC;

SELECT count(n)
FROM t_func_to_subcolumns;

SELECT count(id)
FROM t_func_to_subcolumns;

SELECT
    id,
    isNull(`left`.n),
    isNull(`right`.n)
FROM
    t_func_to_subcolumns AS `left`
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
ORDER BY id ASC;

SELECT
    isNull(t),
    t.`null`
FROM t_tuple_null;