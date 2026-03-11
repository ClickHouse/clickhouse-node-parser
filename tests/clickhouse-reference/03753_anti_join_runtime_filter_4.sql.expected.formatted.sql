SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
SETTINGS enable_join_runtime_filters = 0;

SELECT count()
FROM
    customer
LEFT JOIN (
        SELECT *
        FROM nation
        WHERE n_name = 'FRANCE'
    ) AS n
    ON c_nationkey = n.n_nationkey
SETTINGS enable_join_runtime_filters = 0;

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
SETTINGS enable_join_runtime_filters = 1;

SELECT count()
FROM
    customer
LEFT JOIN (
        SELECT *
        FROM nation
        WHERE n_name = 'FRANCE'
    ) AS n
    ON c_nationkey = n.n_nationkey
SETTINGS enable_join_runtime_filters = 1;