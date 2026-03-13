-- RIGHT ANTI JOIN
SELECT REGEXP_REPLACE(`explain`, '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM customer
        WHERE NOT EXISTS((
                SELECT *
                FROM nation
                WHERE c_nationkey = n_nationkey
            ))
    )
SETTINGS correlated_subqueries_default_join_kind = 'right';

SELECT count()
FROM customer
WHERE NOT EXISTS((
        SELECT *
        FROM nation
        WHERE c_nationkey = n_nationkey
    ))
SETTINGS correlated_subqueries_default_join_kind = 'right';

-- LEFT ANTI JOIN
SELECT REGEXP_REPLACE(`explain`, '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM customer
        WHERE NOT EXISTS((
                SELECT *
                FROM nation
                WHERE c_nationkey = n_nationkey
            ))
    )
SETTINGS correlated_subqueries_default_join_kind = 'left';

SELECT count()
FROM customer
WHERE NOT EXISTS((
        SELECT *
        FROM nation
        WHERE c_nationkey = n_nationkey
    ))
SETTINGS correlated_subqueries_default_join_kind = 'left';