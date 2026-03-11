SELECT
    o_orderpriority,
    count(*) AS order_count
FROM (
        SELECT
            o_orderpriority,
            o_orderkey
        FROM orders
        WHERE (o_orderdate >= toDate('1993-07-01'))
            AND (o_orderdate < (toDate('1993-07-01') + toIntervalMonth('3')))
    )
WHERE exists((
        SELECT l_orderkey
        FROM lineitem
        WHERE (l_orderkey = o_orderkey)
            AND (l_commitdate < l_receiptdate)
    ))
GROUP BY o_orderpriority
ORDER BY o_orderpriority ASC
FORMAT Null;