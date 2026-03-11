SELECT count() FROM
(
    EXPLAIN actions = 1 SELECT * FROM test_indexHint_prewhere
    WHERE (id IN (62, 88, 89, 67)) AND ((colA LIKE '%ymo82%') OR (colB LIKE '%dKappNQY6I%'))
)
WHERE explain LIKE '%Prewhere filter column%colA%colB%';
SELECT count() FROM
(
    EXPLAIN actions = 1 SELECT * FROM test_indexHint_prewhere
    WHERE (id IN (62, 88, 89, 67)) AND ((indexHint(has(tokens(colA), 'ymo82')) AND (colA LIKE '%ymo82%')) OR (indexHint(has(tokens(colB), 'dKappNQY6I')) AND (colB LIKE '%dKappNQY6I%')))
)
WHERE explain LIKE '%Prewhere filter column%colA%colB%';
