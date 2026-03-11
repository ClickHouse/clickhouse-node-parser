SELECT *
FROM t
WHERE i < 5
    AND j IN (1, 2);

SELECT count()
FROM (
        SELECT
            fromUnixTimestamp64Milli(time, 'UTC') AS time_fmt,
            name
        FROM test
        WHERE time_fmt > '2022-09-05 00:00:00'
    );