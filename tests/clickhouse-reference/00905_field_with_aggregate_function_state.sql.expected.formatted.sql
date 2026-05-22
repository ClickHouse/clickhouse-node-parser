WITH (
        SELECT sumState(1)
    ) AS s

SELECT sumMerge(s);

WITH (
        SELECT sumState(number)
        FROM (
                SELECT *
                FROM `system`.numbers
                LIMIT 10
            )
    ) AS s

SELECT sumMerge(s);

WITH (
        SELECT quantileState(0.5)(number)
        FROM (
                SELECT *
                FROM `system`.numbers
                LIMIT 10
            )
    ) AS s

SELECT quantileMerge(s);