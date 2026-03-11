SELECT ans > -67.01
    AND ans < -66.9
FROM (
        WITH (
                SELECT state
                FROM model
            ) AS model

        SELECT evalMLMethod(model, predict1, predict2) AS ans
        FROM defaults
        LIMIT 1
    );

SELECT ans > 0.49
    AND ans < 0.51
FROM (
        SELECT stochasticLinearRegression(0.03, 0.00001, 2, 'Nesterov')(target, param1, param2)[1] AS ans
        FROM defaults
    );

SELECT ans > -2.01
    AND ans < -1.99
FROM (
        SELECT stochasticLinearRegression(0.03, 0.00001, 2, 'Nesterov')(target, param1, param2)[2] AS ans
        FROM defaults
    );

SELECT ans > 2.99
    AND ans < 3.01
FROM (
        SELECT stochasticLinearRegression(0.03, 0.00001, 2, 'Nesterov')(target, param1, param2)[3] AS ans
        FROM defaults
    );

SELECT ANS[1] > -1.1
    AND ANS[1] < -0.9
    AND ANS[2] > 5.9
    AND ANS[2] < 6.1
    AND ANS[3] > 9.9
    AND ANS[3] < 10.1
FROM (
        SELECT stochasticLinearRegression(0.05, 0, 1, 'SGD')(target, p1, p2) AS ANS
        FROM grouptest
        GROUP BY user_id
        ORDER BY user_id ASC
        LIMIT 1, 1
    );

SELECT ANS[1] > 1.9
    AND ANS[1] < 2.1
    AND ANS[2] > 2.9
    AND ANS[2] < 3.1
    AND ANS[3] > -3.1
    AND ANS[3] < -2.9
FROM (
        SELECT stochasticLinearRegression(0.05, 0, 1, 'SGD')(target, p1, p2) AS ANS
        FROM grouptest
        GROUP BY user_id
        ORDER BY user_id ASC
        LIMIT 0, 1
    );