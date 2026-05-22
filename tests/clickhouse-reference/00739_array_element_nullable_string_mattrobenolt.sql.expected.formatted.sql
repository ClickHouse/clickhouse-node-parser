DROP TEMPORARY TABLE IF EXISTS wups;

CREATE TEMPORARY TABLE wups
(
    a Array(Nullable(String))
);

SELECT
    count(),
    a[1]
FROM wups
GROUP BY a[1];

INSERT INTO wups (a);

INSERT INTO wups (a);

SELECT
    count(),
    a[1]
FROM wups
GROUP BY a[1]
ORDER BY a[1] ASC;

DROP TEMPORARY TABLE wups;

SELECT a[1]
FROM wups;