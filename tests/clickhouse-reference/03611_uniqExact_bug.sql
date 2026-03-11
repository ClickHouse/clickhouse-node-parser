select '--- ROLLUP ---' format TSVRaw;
SELECT
    c1,
    uniqExact(c2)
FROM test
GROUP BY c1
    WITH ROLLUP
ORDER BY c1 DESC;
SELECT
    c1,
    uniqExact(c2)
FROM test
GROUP BY c1
    WITH CUBE
ORDER BY c1 DESC;
SELECT
    c1,
    uniqExact(c2)
FROM test
GROUP BY c1
    WITH TOTALS
ORDER BY c1 DESC;
SELECT
    c1,
    uniqExact(c2)
FROM test
GROUP BY 
    GROUPING SETS(
      (c1),
      ()
    )
ORDER BY c1 DESC;
