SELECT `explain`
FROM (
        EXPLAIN actions = 1, keep_logical_steps = 1
        SELECT sum(l_extendedprice) / 7.0 AS avg_yearly
        FROM (
                SELECT
                    l_quantity,
                    p_partkey,
                    l_extendedprice
                FROM
                    lineitem
                CROSS JOIN part
                WHERE p_partkey = l_partkey
            ) AS lp
        WHERE l_quantity < (
                SELECT 0.2 * avg(l_quantity)
                FROM lineitem
                WHERE l_partkey = p_partkey
            )
    )
WHERE ilike(`explain`, '%ReadFrom%')
    OR ilike(`explain`, '%JoinLogical%')
    OR ilike(`explain`, '% Type: %')
    OR ilike(`explain`, '%Save%');

SELECT '-- No join order optimization --';