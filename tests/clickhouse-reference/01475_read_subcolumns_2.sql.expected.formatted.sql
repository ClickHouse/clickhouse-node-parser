SELECT *
FROM subcolumns;

SELECT
    t.a,
    t.u,
    t.s,
    nested.col1,
    nested.col2,
    lc
FROM subcolumns;

SELECT
    t.a.size0,
    t.a.`null`,
    t.u,
    t.s,
    t.s.`null`
FROM subcolumns;

SELECT
    sumArray(arr.`null`),
    sum(arr.size0)
FROM subcolumns;

SELECT
    arr2,
    arr2.size0,
    arr2.size1,
    arr2.`null`
FROM subcolumns;