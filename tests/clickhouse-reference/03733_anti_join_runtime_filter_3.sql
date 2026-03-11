-- 1 element in filter
SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name = 'FRANCE') as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name = 'FRANCE') as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
-- 0 elements in filter ('WAKANDA' is not present in `nations` table)
SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name = 'WAKANDA') as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name = 'WAKANDA') as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
-- again 1 element in filter

SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name IN ('WAKANDA', 'GERMANY')) as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name IN ('WAKANDA', 'GERMANY')) as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
-- 2 elements in filter
SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name IN ('FRANCE', 'GERMANY')) as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name IN ('FRANCE', 'GERMANY')) as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
