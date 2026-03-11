SELECT count()
FROM
    customer
LEFT JOIN (
        SELECT n_nationkey
        FROM nation
        WHERE n_name = 'FRANCE'
    ) AS n
    ON c_nationkey = n.n_nationkey;

SELECT count()
FROM
    (
        SELECT n_nationkey
        FROM nation
        WHERE n_name = 'FRANCE'
    ) AS n
RIGHT JOIN customer
    ON c_nationkey = n.n_nationkey;

SELECT count()
FROM
    customer
LEFT JOIN (
        SELECT n_nationkey
        FROM nation
        WHERE n_name = 'WAKANDA'
    ) AS n
    ON c_nationkey = n.n_nationkey;

SELECT count()
FROM
    (
        SELECT n_nationkey
        FROM nation
        WHERE n_name = 'WAKANDA'
    ) AS n
RIGHT JOIN customer
    ON c_nationkey = n.n_nationkey;

SELECT count()
FROM
    customer
LEFT JOIN (
        SELECT n_nationkey
        FROM nation
        WHERE n_name IN ('WAKANDA', 'GERMANY')
    ) AS n
    ON c_nationkey = n.n_nationkey;

SELECT count()
FROM
    (
        SELECT n_nationkey
        FROM nation
        WHERE n_name IN ('WAKANDA', 'GERMANY')
    ) AS n
RIGHT JOIN customer
    ON c_nationkey = n.n_nationkey;

SELECT count()
FROM
    customer
LEFT JOIN (
        SELECT n_nationkey
        FROM nation
        WHERE n_name IN ('FRANCE', 'GERMANY')
    ) AS n
    ON c_nationkey = n.n_nationkey;

SELECT count()
FROM
    (
        SELECT n_nationkey
        FROM nation
        WHERE n_name IN ('FRANCE', 'GERMANY')
    ) AS n
RIGHT JOIN customer
    ON c_nationkey = n.n_nationkey;