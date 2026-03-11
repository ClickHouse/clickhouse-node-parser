SELECT ans < 1.1
    AND ans > 0.9
FROM (
        WITH (
                SELECT state
                FROM model
            ) AS model

        SELECT evalMLMethod(model, predict1, predict2) AS ans
        FROM defaults
        LIMIT 2
    );

SELECT ans > -0.1
    AND ans < 0.1
FROM (
        WITH (
                SELECT state
                FROM model
            ) AS model

        SELECT evalMLMethod(model, predict1, predict2) AS ans
        FROM defaults
        LIMIT 2
    );