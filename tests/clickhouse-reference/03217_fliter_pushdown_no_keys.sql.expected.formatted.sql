SELECT *
FROM (
        SELECT
            sum(last_seen) AS dates_seen,
            materialize(1) AS last_seen
    )
WHERE last_seen > 2;

SELECT *
FROM (
        SELECT
            sum(last_seen) AS dates_seen,
            materialize(2) AS last_seen
    )
WHERE last_seen < 2;

SELECT *
FROM (
        SELECT
            sum(last_seen) AS dates_seen,
            materialize(2) AS last_seen
        GROUP BY 'a'
    )
WHERE last_seen < 2;

SELECT '---';

SELECT *
FROM (
        SELECT
            sum(last_seen) AS dates_seen,
            1 AS last_seen
        UNION ALL
        SELECT
            sum(last_seen) AS dates_seen,
            3 AS last_seen
    )
WHERE last_seen < 2;

SELECT *
FROM (
        SELECT
            sum(last_seen) AS dates_seen,
            1 AS last_seen
        UNION ALL
        SELECT
            sum(last_seen) AS dates_seen,
            3 AS last_seen
    )
WHERE last_seen > 2;