SELECT *
FROM test_table
WHERE isNull(B);

SELECT *
FROM dm_metric_small2
WHERE (x = 1)
    AND (y = 1)
    AND isNull(z);