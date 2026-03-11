SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        LEFT JOIN nation
            ON c_nationkey = n_nationkey
            AND n_name = 'FRANCE'
            AND c_custkey = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Prewhere filter column%')
    OR like(`explain`, '%Type%')
    OR like(`explain`, '%Strictness%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        RIGHT JOIN nation
            ON c_nationkey = n_nationkey
            AND n_name = 'FRANCE'
            AND c_custkey = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Prewhere filter column%')
    OR like(`explain`, '%Type%')
    OR like(`explain`, '%Strictness%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        LEFT JOIN nation
            ON c_nationkey = n_nationkey
            AND n_name = 'FRANCE'
            AND c_custkey = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Prewhere filter column%')
    OR like(`explain`, '%Type%')
    OR like(`explain`, '%Strictness%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        RIGHT JOIN nation
            ON c_nationkey = n_nationkey
            AND n_name = 'FRANCE'
            AND c_custkey = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Prewhere filter column%')
    OR like(`explain`, '%Type%')
    OR like(`explain`, '%Strictness%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        LEFT JOIN nation
            ON c_nationkey = n_nationkey
            AND n_name = 'FRANCE'
            AND c_custkey = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Prewhere filter column%')
    OR like(`explain`, '%Type%')
    OR like(`explain`, '%Strictness%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM
            customer
        RIGHT JOIN nation
            ON c_nationkey = n_nationkey
            AND n_name = 'FRANCE'
            AND c_custkey = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Prewhere filter column%')
    OR like(`explain`, '%Type%')
    OR like(`explain`, '%Strictness%');