SELECT trimLeft(`explain`) AS s
FROM (
        EXPLAIN
        SELECT
            v,
            blob
        FROM pr_tt
        ORDER BY k ASC
        LIMIT 10
        SETTINGS parallel_replicas_local_plan = 1
    )
WHERE ilike(s, 'LazilyRead%');

SELECT
    v,
    blob
FROM pr_tt
ORDER BY k ASC
LIMIT 10;