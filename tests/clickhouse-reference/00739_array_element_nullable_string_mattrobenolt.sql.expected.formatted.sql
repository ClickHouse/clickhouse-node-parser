CREATE TEMPORARY TABLE wups
(
    a Array(Nullable(String))
);

SELECT
    count(),
    a[1]
FROM wups
GROUP BY a[1];

SELECT
    count(),
    a[1]
FROM wups
GROUP BY a[1]
ORDER BY a[1] ASC;

SELECT a[1]
FROM wups;