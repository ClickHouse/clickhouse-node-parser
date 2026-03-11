SELECT
    app,
    arrayZip(untuple(sumMap(k.keys, replicate(1, k.keys))))
FROM test_03093
PREWHERE c > 1
GROUP BY app;

SELECT
    app,
    arrayZip(untuple(sumMap(k.keys, replicate(1, k.keys))))
FROM test_03093
WHERE c > 1
GROUP BY app;