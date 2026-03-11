SELECT count()
FROM test
WHERE x = 'x_1'
    AND y.s = 'y_1';

SELECT
    x,
    y.s,
    z
FROM test
WHERE x = 'x_1'
    AND y.s = 'y_1';