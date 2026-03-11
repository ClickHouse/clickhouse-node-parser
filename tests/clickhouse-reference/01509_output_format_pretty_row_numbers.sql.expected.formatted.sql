SELECT *
FROM numbers(10)
FORMAT Pretty;

SELECT *
FROM numbers(10)
FORMAT PrettyCompact;

SELECT *
FROM numbers(10)
FORMAT PrettyCompactMonoBlock;

SELECT *
FROM numbers(10)
FORMAT PrettyNoEscapes;

SELECT *
FROM numbers(10)
FORMAT PrettyCompactNoEscapes;

SELECT *
FROM numbers(10)
FORMAT PrettySpaceNoEscapes;

SELECT *
FROM numbers(10)
FORMAT PrettySpace;

SELECT *
FROM (
        SELECT 1 AS a
        UNION ALL
        SELECT 2 AS a
    )
ORDER BY a ASC
FORMAT Pretty;

SELECT *
FROM (
        SELECT 1 AS a
        UNION ALL
        SELECT 2 AS a
    )
ORDER BY a ASC
FORMAT PrettyCompact;

SELECT *
FROM (
        SELECT 1 AS a
        UNION ALL
        SELECT 2 AS a
    )
ORDER BY a ASC
FORMAT PrettyCompactMonoBlock;

SELECT *
FROM (
        SELECT 1 AS a
        UNION ALL
        SELECT 2 AS a
    )
ORDER BY a ASC
FORMAT PrettyNoEscapes;

SELECT *
FROM (
        SELECT 1 AS a
        UNION ALL
        SELECT 2 AS a
    )
ORDER BY a ASC
FORMAT PrettyCompactNoEscapes;

SELECT *
FROM (
        SELECT 1 AS a
        UNION ALL
        SELECT 2 AS a
    )
ORDER BY a ASC
FORMAT PrettySpace;

SELECT *
FROM (
        SELECT 1 AS a
        UNION ALL
        SELECT 2 AS a
    )
ORDER BY a ASC
FORMAT PrettySpaceNoEscapes;

SELECT *
FROM numbers(10)
ORDER BY number ASC
FORMAT Pretty;

SELECT *
FROM numbers(10)
ORDER BY number ASC
FORMAT PrettyCompact;

SELECT *
FROM numbers(10)
ORDER BY number ASC
FORMAT PrettyCompactMonoBlock;

SELECT *
FROM numbers(10)
ORDER BY number ASC
FORMAT PrettyNoEscapes;

SELECT *
FROM numbers(10)
ORDER BY number ASC
FORMAT PrettyCompactNoEscapes;

SELECT *
FROM numbers(10)
ORDER BY number ASC
FORMAT PrettySpace;

SELECT *
FROM numbers(10)
ORDER BY number ASC
FORMAT PrettySpaceNoEscapes;