SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
RIGHT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
RIGHT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
RIGHT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;