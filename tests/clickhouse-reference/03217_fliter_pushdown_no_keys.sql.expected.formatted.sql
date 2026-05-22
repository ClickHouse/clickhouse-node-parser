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

WITH activity AS (
    SELECT
        groupUniqArrayState(toDate('2025-01-01 01:00:00')) AS dates_seen,
        toDateTime('2025-01-01 01:00:00') AS last_seen
    UNION ALL
    SELECT
        groupUniqArrayState(toDate('2023-11-11 11:11:11')) AS dates_seen,
        toDateTime('2023-11-11 11:11:11') AS last_seen
)

SELECT last_seen
FROM activity
WHERE last_seen < toDateTime('2020-01-01 00:00:00');