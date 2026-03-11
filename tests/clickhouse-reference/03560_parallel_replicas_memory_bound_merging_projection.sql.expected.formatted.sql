SELECT trimLeft(*)
FROM (
        EXPLAIN
        SELECT sum(b)
        FROM pr_t
        GROUP BY a
        ORDER BY a ASC
        LIMIT 5
        OFFSET 500
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT sum(b)
FROM pr_t
GROUP BY a
ORDER BY a ASC
LIMIT 5
OFFSET 500;