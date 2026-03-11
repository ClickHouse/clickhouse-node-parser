SELECT count(1)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(10) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(1000000)
            ) AS j
            USING (k)
    );

SELECT count(1)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(1000) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(10000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(n)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(1000000) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(10)
            ) AS j
            USING (k)
    );

SELECT count(1)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(10) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(1000000)
            ) AS j
            USING (k)
    )
SETTINGS enable_analyzer = 0;

SELECT count(1)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(1000) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(10000)
            ) AS j
            USING (k)
    )
SETTINGS enable_analyzer = 0;

SELECT count(1)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(10) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(1000000)
            ) AS j
            USING (k)
    )
SETTINGS enable_analyzer = 1;

SELECT count(1)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(1000) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(10000)
            ) AS j
            USING (k)
    )
SETTINGS enable_analyzer = 1;

SELECT
    count(1),
    uniqExact(n)
FROM (
        SELECT
            materialize(1) AS k,
            n
        FROM
            numbers(1000) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(10000)
            ) AS j
            USING (k)
    );