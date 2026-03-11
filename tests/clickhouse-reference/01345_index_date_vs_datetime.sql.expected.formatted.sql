SELECT *
FROM index
WHERE d > toDateTime('2020-04-06 23:59:59');

SELECT *
FROM index
WHERE identity(d > toDateTime('2020-04-06 23:59:59'));