SELECT
    s,
    SUM(i * 2) AS i
FROM test_00562
GROUP BY s
UNION ALL
SELECT
    s,
    SUM(i * 2) AS i
FROM test_00562
GROUP BY s;

SELECT s
FROM (
        SELECT
            s,
            SUM(i * 2) AS i
        FROM test_00562
        GROUP BY s
        UNION ALL
        SELECT
            s,
            SUM(i * 2) AS i
        FROM test_00562
        GROUP BY s
    );