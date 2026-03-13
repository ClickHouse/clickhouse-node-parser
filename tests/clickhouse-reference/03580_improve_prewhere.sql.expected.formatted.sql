-- Condition: lower(primary_key) = '00' can't make use of primary key index. It shouldn't be moved to the end of prewhere conditions.
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM test_improve_prewhere
        WHERE date = '2025-08-05'
            AND lower(primary_key) = '00'
            AND normal_column != 'hello'
            AND value < 100
    )
WHERE ilike(`explain`, '%Prewhere filter column%');

-- Condition: primary_key = '00' can use primary key index. It should be moved to the end of prewhere conditions.
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM test_improve_prewhere
        WHERE date = '2025-08-05'
            AND primary_key = '00'
            AND normal_column != 'hello'
            AND value < 100
    )
WHERE ilike(`explain`, '%Prewhere filter column%');

-- Condition: lower(primary_key) IN ('00', '01') should be placed before Condition: normal_column != 'hello' and value < 100
-- because it has a lower estimated selectivity.
SELECT trimLeft(replaceRegexpAll(`explain`, '__set_String_\\d+_\\d+', '__set_String'))
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM test_improve_prewhere
        WHERE date = '2025-08-05'
            AND lower(primary_key) IN ('00', '01')
            AND normal_column != 'hello'
            AND value < 100
    )
WHERE ilike(`explain`, '%Prewhere filter column%');