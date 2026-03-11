SELECT *
FROM test
ORDER BY d ASC;

SELECT *
FROM test
ORDER BY tuple(d) ASC;

SELECT *
FROM test
ORDER BY array(d) ASC;

SELECT *
FROM test
ORDER BY map('str', d) ASC;

SELECT *
FROM test
GROUP BY d;

SELECT *
FROM test
GROUP BY tuple(d);

SELECT array(d)
FROM test
GROUP BY array(d);

SELECT map('str', d)
FROM test
GROUP BY map('str', d);

SELECT *
FROM test
GROUP BY GROUPING SETS ((d), ('str'));

SELECT *
FROM test
GROUP BY d
ORDER BY `all` ASC;

SELECT *
FROM test
GROUP BY tuple(d)
ORDER BY `all` ASC;

SELECT array(d)
FROM test
GROUP BY array(d)
ORDER BY `all` ASC;

SELECT map('str', d)
FROM test
GROUP BY map('str', d)
ORDER BY `all` ASC;

SELECT *
FROM test
GROUP BY GROUPING SETS ((d), ('str'))
ORDER BY `all` ASC;