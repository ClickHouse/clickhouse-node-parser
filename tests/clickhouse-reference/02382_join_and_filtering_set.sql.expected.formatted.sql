SELECT count()
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x;

SELECT count()
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
WHERE t1.y % 2 == 0;

SELECT count()
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
WHERE t1.x % 2 == 0;

SELECT count()
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
WHERE t2.y % 2 == 0;

SELECT count()
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
WHERE t2.x % 2 == 0;

SELECT count()
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
WHERE t1.y % 2 == 0
    AND t2.y % 2 == 0;

SELECT count()
FROM
    t1
INNER JOIN t2
    ON t1.x = t2.x
WHERE t1.x % 2 == 0
    AND t2.x % 2 == 0
    AND t1.y % 2 == 0
    AND t2.y % 2 == 0;

SELECT *
FROM
    (
        SELECT 'a' AS key
    ) AS t1
INNER JOIN (
        SELECT 'a' AS key
    ) AS t2
    ON t1.key = t2.key;

SELECT count() > 1
FROM (
        EXPLAIN PIPELINE
        SELECT *
        FROM
            (
                SELECT materialize('a') AS key
            ) AS t1
        INNER JOIN (
                SELECT materialize('a') AS key
            ) AS t2
            ON t1.key = t2.key
    )
WHERE ilike(`explain`, '%FilterBySetOnTheFlyTransform%');

SELECT count() == 0
FROM (
        EXPLAIN PIPELINE
        SELECT *
        FROM
            (
                SELECT 'a' AS key
            ) AS t1
        INNER JOIN (
                SELECT 'a' AS key
            ) AS t2
            ON t1.key = t2.key
    )
WHERE ilike(`explain`, '%FilterBySetOnTheFlyTransform%');