SELECT *
FROM (
        SELECT
            dummy,
            -1 AS x
        UNION ALL
        SELECT
            dummy,
            arrayJoin([-1]) AS x
    );

SELECT *
FROM (
        SELECT
            -1 AS x,
            dummy
        UNION ALL
        SELECT
            arrayJoin([-1]) AS x,
            dummy
    );