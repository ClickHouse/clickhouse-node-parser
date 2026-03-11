SELECT x
FROM t_missed_subcolumns
WHERE isNotNull(y)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT x
FROM t_missed_subcolumns
WHERE isNotNull(y)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT
    id,
    n.a,
    n.b
FROM t_missed_subcolumns
ORDER BY id ASC;

SELECT
    id,
    n.a.size0,
    n.b.size0
FROM t_missed_subcolumns
ORDER BY id ASC;

SELECT
    id,
    n.a.`null`,
    n.b.`null`
FROM t_missed_subcolumns
ORDER BY id ASC;

SELECT n.b.size0
FROM t_missed_subcolumns
ORDER BY id ASC;

SELECT
    id,
    t,
    arr
FROM t_missed_subcolumns
ORDER BY id ASC;

SELECT
    id,
    t.a,
    t.b,
    arr.size0,
    arr.`null`
FROM t_missed_subcolumns
ORDER BY id ASC;