SELECT sum(l_extendedprice) / 7.0 AS avg_yearly
FROM (
        SELECT *
        FROM
            lineitem
        CROSS JOIN part
        WHERE p_partkey = l_partkey
    ) AS lp
WHERE l_quantity < (
        SELECT 0.2 * avg(l_quantity)
        FROM lineitem
        WHERE l_partkey = lp.p_partkey
    )
FORMAT Null;