SELECT count()
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM test_indexHint_prewhere
        WHERE (id IN (62, 88, 89, 67))
            AND (((like(colA, '%ymo82%'))
            OR (like(colB, '%dKappNQY6I%'))))
    )
WHERE like(`explain`, '%Prewhere filter column%colA%colB%');

SELECT count()
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM test_indexHint_prewhere
        WHERE (id IN (62, 88, 89, 67))
            AND (((indexHint(has(tokens(colA), 'ymo82'))
            AND (like(colA, '%ymo82%')))
            OR (indexHint(has(tokens(colB), 'dKappNQY6I'))
            AND (like(colB, '%dKappNQY6I%')))))
    )
WHERE like(`explain`, '%Prewhere filter column%colA%colB%');