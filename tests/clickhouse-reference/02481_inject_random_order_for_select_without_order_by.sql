SELECT count()
FROM (EXPLAIN PLAN SELECT number FROM numbers(5))
WHERE explain LIKE '%Sorting%';
SELECT count()
FROM (EXPLAIN PLAN SELECT number FROM numbers(5) ORDER BY number)
WHERE explain LIKE '%Sorting%';
SELECT count()
FROM (
    EXPLAIN PLAN
    SELECT number FROM numbers(5)
    UNION ALL
    SELECT number FROM numbers(5)
)
WHERE explain LIKE '%Sorting%';
