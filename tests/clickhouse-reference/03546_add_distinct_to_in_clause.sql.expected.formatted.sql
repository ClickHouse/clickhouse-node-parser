SELECT id
FROM distributed_table_1
WHERE id IN (
        SELECT id
        FROM distributed_table_2
    )
SETTINGS enable_add_distinct_to_in_subqueries = 1;

-- Query with DISTINCT optimization disabled
SELECT id
FROM distributed_table_1
WHERE id IN (
        SELECT id
        FROM distributed_table_2
    )
SETTINGS enable_add_distinct_to_in_subqueries = 0;