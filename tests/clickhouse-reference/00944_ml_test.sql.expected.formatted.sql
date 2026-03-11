SELECT ans < -61.374
    AND ans > -61.375
FROM (
        WITH (
                SELECT state
                FROM remote('127.0.0.1', currentDatabase(), model)
            ) AS model

        SELECT evalMLMethod(model, predict1, predict2) AS ans
        FROM remote('127.0.0.1', currentDatabase(), defaults)
    );

SELECT 0 < ans[1]
    AND ans[1] < 0.15
    AND 0.95 < ans[2]
    AND ans[2] < 1.0
    AND 0 < ans[3]
    AND ans[3] < 0.05
FROM (
        SELECT stochasticLinearRegression(0.000001, 0.01, 100, 'SGD')(number, rand() % 100, number) AS ans
        FROM numbers(1000)
    );