SELECT
    1 AS x,
    x = 1
    OR x = 2
    OR x = 3
    OR x = -1;

SELECT
    1 AS x,
    x = 1.0
    OR x = 2
    OR x = 3
    OR x = -1;

SELECT
    1 AS x,
    x = 1.5
    OR x = 2
    OR x = 3
    OR x = -1;

SELECT
    1 IN (1, -1, 2.0, 2.5),
    1.0 IN (1, -1, 2.0, 2.5),
    1 IN (1.0, -1, 2.0, 2.5),
    1.0 IN (1.0, -1, 2.0, 2.5),
    1 IN (1.1, -1, 2.0, 2.5),
    -1 IN (1, -1, 2.0, 2.5);

SELECT negate(number) IN (1, 2, 3, -5.0, -2.0)
FROM `system`.numbers
LIMIT 10;