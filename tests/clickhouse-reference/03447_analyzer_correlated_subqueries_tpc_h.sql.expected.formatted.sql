SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part
CROSS JOIN supplier
CROSS JOIN partsupp
CROSS JOIN nation
CROSS JOIN region
WHERE p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND like(p_type, '%BRASS')
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT min(ps_supplycost)
        FROM
            partsupp
        CROSS JOIN supplier
        CROSS JOIN nation
        CROSS JOIN region
        WHERE p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name ASC,
    s_name ASC,
    p_partkey ASC
FORMAT Null;

SELECT
    o_orderpriority,
    count(*) AS order_count
FROM orders
WHERE o_orderdate >= toDate('1993-07-01')
    AND o_orderdate < toDate('1993-07-01') + toIntervalMonth('3')
    AND EXISTS((
        SELECT *
        FROM lineitem
        WHERE l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    ))
GROUP BY o_orderpriority
ORDER BY o_orderpriority ASC
FORMAT Null;

SELECT sum(l_extendedprice) / 7.0 AS avg_yearly
FROM
    lineitem
CROSS JOIN part
WHERE p_partkey = l_partkey
    AND p_brand = 'Brand#23'
    AND p_container = 'MED BOX'
    AND l_quantity < (
        SELECT 0.2 * avg(l_quantity)
        FROM lineitem
        WHERE l_partkey = p_partkey
    )
FORMAT Null;

SELECT
    s_name,
    s_address
FROM
    supplier
CROSS JOIN nation
WHERE s_suppkey IN (
        SELECT ps_suppkey
        FROM partsupp
        WHERE ps_partkey IN (
                SELECT p_partkey
                FROM part
                WHERE like(p_name, 'forest%')
            )
            AND ps_availqty > (
                SELECT 0.5 * sum(l_quantity)
                FROM lineitem
                WHERE l_partkey = ps_partkey
                    AND l_suppkey = ps_suppkey
                    AND l_shipdate >= toDate('1994-01-01')
                    AND l_shipdate < toDate('1994-01-01') + toIntervalYear('1')
            )
    )
    AND s_nationkey = n_nationkey
    AND n_name = 'CANADA'
ORDER BY s_name ASC
FORMAT Null;

SELECT
    s_name,
    count(*) AS numwait
FROM
    supplier
CROSS JOIN lineitem AS l1
CROSS JOIN orders
CROSS JOIN nation
WHERE s_suppkey = l1.l_suppkey
    AND o_orderkey = l1.l_orderkey
    AND o_orderstatus = 'F'
    AND l1.l_receiptdate > l1.l_commitdate
    AND EXISTS((
        SELECT *
        FROM lineitem AS l2
        WHERE l2.l_orderkey = l1.l_orderkey
            AND l2.l_suppkey <> l1.l_suppkey
    ))
    AND NOT EXISTS((
        SELECT *
        FROM lineitem AS l3
        WHERE l3.l_orderkey = l1.l_orderkey
            AND l3.l_suppkey <> l1.l_suppkey
            AND l3.l_receiptdate > l3.l_commitdate
    ))
    AND s_nationkey = n_nationkey
    AND n_name = 'SAUDI ARABIA'
GROUP BY s_name
ORDER BY
    numwait DESC,
    s_name ASC
FORMAT Null;

SELECT
    cntrycode,
    count(*) AS numcust,
    sum(c_acctbal) AS totacctbal
FROM (
        SELECT
            substring(c_phone, 1, 2) AS cntrycode,
            c_acctbal
        FROM customer
        WHERE substring(c_phone, 1, 2) IN ('13', '31', '23', '29', '30', '18', '17')
            AND c_acctbal > (
                SELECT avg(c_acctbal)
                FROM customer
                WHERE c_acctbal > 0.00
                    AND substring(c_phone, 1, 2) IN ('13', '31', '23', '29', '30', '18', '17')
            )
            AND NOT EXISTS((
                SELECT *
                FROM orders
                WHERE o_custkey = c_custkey
            ))
    ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode ASC
FORMAT Null;