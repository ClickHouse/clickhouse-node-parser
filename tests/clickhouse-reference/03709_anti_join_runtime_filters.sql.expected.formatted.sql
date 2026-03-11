SELECT REGEXP_REPLACE(trimLeft(`explain`), '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        LEFT JOIN nation
            ON c_nationkey = n_nationkey
    )
WHERE (ilike(`explain`, '%Filter column%'))
    OR (like(`explain`, '%BuildRuntimeFilter%'))
    OR (like(`explain`, '% Type:%'))
    OR (like(`explain`, '% Strictness:%'));

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
SETTINGS enable_join_runtime_filters = 0;

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
SETTINGS enable_join_runtime_filters = 1;

SELECT REGEXP_REPLACE(trimLeft(`explain`), '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        RIGHT JOIN nation
            ON c_nationkey = n_nationkey
    )
WHERE (ilike(`explain`, '%Filter column%'))
    OR (like(`explain`, '%BuildRuntimeFilter%'))
    OR (like(`explain`, '% Type:%'))
    OR (like(`explain`, '% Strictness:%'));