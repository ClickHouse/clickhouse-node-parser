SELECT a
FROM (
        SELECT *
        FROM `columns`
    );

SELECT a
FROM (
        SELECT *
        FROM (
                SELECT *
                FROM `columns`
            )
    );

SELECT a
FROM (
        SELECT *
        FROM `columns`
        UNION ALL
        SELECT *
        FROM `columns`
    );