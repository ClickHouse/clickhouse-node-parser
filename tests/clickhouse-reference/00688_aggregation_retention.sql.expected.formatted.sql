SELECT
    sum(r[1]) AS r1,
    sum(r[2]) AS r2
FROM (
        SELECT
            uid,
            retention(date = '2018-08-06', date = '2018-08-07') AS r
        FROM retention_test
        WHERE date IN ('2018-08-06', '2018-08-07')
        GROUP BY uid
    );

SELECT
    sum(r[1]) AS r1,
    sum(r[2]) AS r2
FROM (
        SELECT
            uid,
            retention(date = '2018-08-06', date = '2018-08-08') AS r
        FROM retention_test
        WHERE date IN ('2018-08-06', '2018-08-08')
        GROUP BY uid
    );

SELECT
    sum(r[1]) AS r1,
    sum(r[2]) AS r2,
    sum(r[3]) AS r3
FROM (
        SELECT
            uid,
            retention(date = '2018-08-06', date = '2018-08-07', date = '2018-08-08') AS r
        FROM retention_test
        WHERE date IN ('2018-08-06', '2018-08-07', '2018-08-08')
        GROUP BY uid
    );