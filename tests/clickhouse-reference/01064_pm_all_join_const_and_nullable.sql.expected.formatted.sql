SET join_algorithm = 'partial_merge';

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    1 AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT 1 AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT 1 AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    1 AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(toNullable(1)) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(toNullable(1)) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    1 AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT toNullable(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT toNullable(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    1 AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(toNullable(1)) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    toNullable(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT 1 AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(toNullable(1)) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT 1 AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    toNullable(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(toNullable(1)) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(toNullable(1)) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT materialize(toNullable(1)) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    toNullable(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT toNullable(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    materialize(toNullable(1)) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );

SELECT
    count(1),
    uniqExact(1)
FROM (
        SELECT k
        FROM
            (
                SELECT toNullable(1) AS k
                FROM numbers(1)
            ) AS nums
        INNER JOIN (
                SELECT
                    toNullable(1) AS k,
                    number AS n
                FROM numbers(100000)
            ) AS j
            USING (k)
    );