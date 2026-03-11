SELECT
    ps_partkey,
    ps_suppkey,
    (
        SELECT 0.5 * sum(l_quantity)
        FROM lineitem
        WHERE (l_partkey = ps_partkey)
            AND (l_suppkey = ps_suppkey)
    ) AS half_sum_quantity
FROM partsupp
WHERE (ps_partkey, ps_suppkey) IN ((114, 115), (369, 7870))
ORDER BY
    ps_partkey ASC,
    ps_suppkey ASC;

SELECT
    ps_partkey,
    ps_suppkey
FROM partsupp
WHERE ps_availqty > (
        SELECT 0.5 * sum(l_quantity)
        FROM lineitem
        WHERE (l_partkey = ps_partkey)
            AND (l_suppkey = ps_suppkey)
    );