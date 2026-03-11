SELECT
    toStartOfMinute(dt) AS dt_m,
    sum(cost)
FROM projection_test
GROUP BY dt_m;

SELECT sum(cost)
FROM projection_test;

SELECT
    toStartOfMinute(dt) AS dt_m,
    sum(cost)
FROM projection_test_d
GROUP BY dt_m;

SELECT sum(cost)
FROM projection_test_d;