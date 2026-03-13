SELECT *
FROM test
ORDER BY d ASC; -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM test
ORDER BY tuple(d) ASC; -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM test
ORDER BY array(d) ASC; -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM test
ORDER BY map('str', d) ASC; -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM test
GROUP BY d; -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM test
GROUP BY tuple(d); -- {serverError ILLEGAL_COLUMN}

SELECT array(d)
FROM test
GROUP BY array(d); -- {serverError ILLEGAL_COLUMN}

SELECT map('str', d)
FROM test
GROUP BY map('str', d); -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM test
GROUP BY GROUPING SETS ((d), ('str')); -- {serverError ILLEGAL_COLUMN}

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