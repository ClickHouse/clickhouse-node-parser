SELECT
    dim1,
    dim2,
    count()
FROM test
GROUP BY GROUPING SETS ((dim1, dim2), (dim1))
ORDER BY
    dim1 ASC,
    dim2 ASC,
    count() ASC;

SELECT
    dim1,
    dim2,
    count()
FROM test
GROUP BY
    dim1,
    dim2
WITH ROLLUP
ORDER BY
    dim1 ASC,
    dim2 ASC,
    count() ASC;

SELECT
    dim1,
    dim2,
    count()
FROM test
GROUP BY
    dim1,
    dim2
WITH CUBE
ORDER BY
    dim1 ASC,
    dim2 ASC,
    count() ASC;

SELECT
    dim1,
    dim2,
    count()
FROM test
GROUP BY
    dim1,
    dim2
WITH TOTALS
ORDER BY
    dim1 ASC,
    dim2 ASC,
    count() ASC;