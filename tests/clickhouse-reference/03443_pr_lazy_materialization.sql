select trimLeft(explain) as s from (EXPLAIN
SELECT
    v,
    blob
FROM pr_tt
ORDER BY k ASC
LIMIT 10 settings parallel_replicas_local_plan=1) where s ilike 'LazilyRead%';
SELECT
    v,
    blob
FROM pr_tt
ORDER BY k
LIMIT 10;
