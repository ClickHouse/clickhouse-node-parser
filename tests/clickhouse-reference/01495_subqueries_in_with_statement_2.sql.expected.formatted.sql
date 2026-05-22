WITH x AS (
    SELECT number AS a
    FROM numbers(10)
),

y AS (
    SELECT number AS a
    FROM numbers(5)
)

SELECT *
FROM x
WHERE a IN (
        SELECT a
        FROM y
    )
ORDER BY a ASC;

WITH x AS (
    SELECT number AS a
    FROM numbers(10)
),

y AS (
    SELECT number AS a
    FROM numbers(5)
)

SELECT *
FROM
    x
LEFT JOIN y
    USING (a)
ORDER BY a ASC;

WITH x AS (
    SELECT number AS a
    FROM numbers(10)
),

y AS (
    SELECT number AS a
    FROM numbers(5)
)

SELECT *
FROM
    x
INNER JOIN y
    USING (a)
ORDER BY x.a ASC;

WITH x AS (
    SELECT number AS a
    FROM numbers(10)
),

y AS (
    SELECT number AS a
    FROM numbers(5)
),

z AS (
    SELECT toUInt64(1) AS b
)

SELECT *
FROM
    x
INNER JOIN y
    USING (a)
WHERE a IN (
        SELECT *
        FROM z
    );

WITH x AS (
    SELECT number AS a
    FROM numbers(10)
),

y AS (
    SELECT number AS a
    FROM numbers(5)
),

z AS (
    SELECT *
    FROM x
    WHERE a % 2
),

w AS (
    SELECT *
    FROM y
    WHERE a > 0
)

SELECT *
FROM
    x
INNER JOIN y
    USING (a)
WHERE a IN (
        SELECT *
        FROM z
    )
ORDER BY x.a ASC;

WITH x AS (
    SELECT number AS a
    FROM numbers(10)
),

y AS (
    SELECT number AS a
    FROM numbers(5)
),

z AS (
    SELECT *
    FROM x
    WHERE a % 2
),

w AS (
    SELECT *
    FROM y
    WHERE a > 0
)

SELECT max(a)
FROM
    x
INNER JOIN y
    USING (a)
WHERE a IN (
        SELECT *
        FROM z
    )
    AND a > (
        SELECT min(a)
        FROM w
    );

WITH x AS (
    SELECT number AS a
    FROM numbers(10)
),

y AS (
    SELECT number AS a
    FROM numbers(5)
),

z AS (
    SELECT *
    FROM x
    WHERE a % 2
),

w AS (
    SELECT *
    FROM y
    WHERE a > 0
)

SELECT a
FROM
    x
INNER JOIN y
    USING (a)
WHERE a IN (
        SELECT *
        FROM z
    )
    AND a <= (
        SELECT max(a)
        FROM w
    )
ORDER BY x.a ASC;