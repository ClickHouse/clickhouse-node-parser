SELECT ans > -67.0
    AND ans < -66.9
FROM (
        WITH (
                SELECT state + state + state
                FROM model
            ) AS model

        SELECT evalMLMethod(model, predict1, predict2) AS ans
        FROM defaults
        ORDER BY `all` ASC
        LIMIT 1
    );