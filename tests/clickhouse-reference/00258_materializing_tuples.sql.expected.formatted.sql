SELECT *
FROM (
        SELECT tuple(1) AS a
        UNION ALL
        SELECT tuple(1) AS a
    )
ORDER BY a ASC;

SELECT *
FROM (
        SELECT tuple(1) AS a
        UNION ALL
        SELECT tuple(2) AS a
    )
ORDER BY a ASC;

SELECT *
FROM (
        SELECT tuple(materialize(0)) AS a
        UNION ALL
        SELECT tuple(0) AS a
    )
ORDER BY a ASC;

SELECT *
FROM (
        SELECT tuple(range(1)[1]) AS a
        UNION ALL
        SELECT tuple(0) AS a
    )
ORDER BY a ASC;

SELECT *
FROM (
        SELECT tuple(range(1)[2]) AS a
        UNION ALL
        SELECT tuple(1) AS a
    )
ORDER BY a ASC;