SELECT 1;

SELECT
    l_returnflag,
    l_linestatus,
    sum(l_quantity) AS sum_qty,
    sum(l_extendedprice) AS sum_base_price,
    sum(l_extendedprice * ((1 - l_discount))) AS sum_disc_price,
    sum(l_extendedprice * ((1 - l_discount)) * ((1 + l_tax))) AS sum_charge,
    avg(l_quantity) AS avg_qty,
    avg(l_extendedprice) AS avg_price,
    avg(l_discount) AS avg_disc,
    count(*) AS count_order
FROM lineitem
WHERE l_shipdate <= toDate('1998-12-01') - toIntervalDay(90)
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag ASC,
    l_linestatus ASC;

SELECT 2;

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
LIMIT 100;

SELECT 3;

SELECT
    l_orderkey,
    sum(l_extendedprice * ((1 - l_discount))) AS revenue,
    o_orderdate,
    o_shippriority
FROM
    customer
CROSS JOIN orders
CROSS JOIN lineitem
WHERE c_mktsegment = 'BUILDING'
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate < toDate('1995-03-15')
    AND l_shipdate > toDate('1995-03-15')
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    revenue DESC,
    o_orderdate ASC
LIMIT 10;

SELECT 4;

SELECT
    o_orderpriority,
    count(*) AS order_count
FROM orders
WHERE o_orderdate >= toDate('1993-07-01')
    AND o_orderdate < toDate('1993-07-01') + toIntervalMonth('3')
    AND exists((
        SELECT *
        FROM lineitem
        WHERE l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    ))
GROUP BY o_orderpriority
ORDER BY o_orderpriority ASC;

SELECT 5;

SELECT
    n_name,
    sum(l_extendedprice * ((1 - l_discount))) AS revenue
FROM
    customer
CROSS JOIN orders
CROSS JOIN lineitem
CROSS JOIN supplier
CROSS JOIN nation
CROSS JOIN region
WHERE c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    AND o_orderdate >= toDate('1994-01-01')
    AND o_orderdate < toDate('1994-01-01') + toIntervalYear('1')
GROUP BY n_name
ORDER BY revenue DESC;

SELECT 6;

SELECT sum(l_extendedprice * l_discount) AS revenue
FROM lineitem
WHERE l_shipdate >= toDate('1994-01-01')
    AND l_shipdate < toDate('1994-01-01') + toIntervalYear('1')
    AND and(greaterOrEquals(l_discount, toDecimal32(0.06, 2) - toDecimal32(0.01, 2)), lessOrEquals(l_discount, toDecimal32(0.06, 2) + toDecimal32(0.01, 2)))
    AND l_quantity < 24;

SELECT 7;

SELECT
    supp_nation,
    cust_nation,
    l_year,
    sum(volume) AS revenue
FROM (
        SELECT
            n1.n_name AS supp_nation,
            n2.n_name AS cust_nation,
            toYear(l_shipdate) AS l_year,
            l_extendedprice * ((1 - l_discount)) AS volume
        FROM
            supplier
        CROSS JOIN lineitem
        CROSS JOIN orders
        CROSS JOIN customer
        CROSS JOIN nation AS n1
        CROSS JOIN nation AS n2
        WHERE s_suppkey = l_suppkey
            AND o_orderkey = l_orderkey
            AND c_custkey = o_custkey
            AND s_nationkey = n1.n_nationkey
            AND c_nationkey = n2.n_nationkey
            AND (((n1.n_name = 'FRANCE'
            AND n2.n_name = 'GERMANY')
            OR (n1.n_name = 'GERMANY'
            AND n2.n_name = 'FRANCE')))
            AND and(greaterOrEquals(l_shipdate, toDate('1995-01-01')), lessOrEquals(l_shipdate, toDate('1996-12-31')))
    ) AS shipping
GROUP BY
    supp_nation,
    cust_nation,
    l_year
ORDER BY
    supp_nation ASC,
    cust_nation ASC,
    l_year ASC;

SELECT 8;

SELECT
    o_year,
    sum(multiIf(nation = 'BRAZIL', volume, 0)) / sum(volume) AS mkt_share
FROM (
        SELECT
            toYear(o_orderdate) AS o_year,
            l_extendedprice * ((1 - l_discount)) AS volume,
            n2.n_name AS nation
        FROM
            part
        CROSS JOIN supplier
        CROSS JOIN lineitem
        CROSS JOIN orders
        CROSS JOIN customer
        CROSS JOIN nation AS n1
        CROSS JOIN nation AS n2
        CROSS JOIN region
        WHERE p_partkey = l_partkey
            AND s_suppkey = l_suppkey
            AND l_orderkey = o_orderkey
            AND o_custkey = c_custkey
            AND c_nationkey = n1.n_nationkey
            AND n1.n_regionkey = r_regionkey
            AND r_name = 'AMERICA'
            AND s_nationkey = n2.n_nationkey
            AND and(greaterOrEquals(o_orderdate, toDate('1995-01-01')), lessOrEquals(o_orderdate, toDate('1996-12-31')))
            AND p_type = 'ECONOMY ANODIZED STEEL'
    ) AS all_nations
GROUP BY o_year
ORDER BY o_year ASC;

SELECT 9;

SELECT
    nation,
    o_year,
    sum(amount) AS sum_profit
FROM (
        SELECT
            n_name AS nation,
            toYear(o_orderdate) AS o_year,
            l_extendedprice * ((1 - l_discount)) - ps_supplycost * l_quantity AS amount
        FROM
            part
        CROSS JOIN supplier
        CROSS JOIN lineitem
        CROSS JOIN partsupp
        CROSS JOIN orders
        CROSS JOIN nation
        WHERE s_suppkey = l_suppkey
            AND ps_suppkey = l_suppkey
            AND ps_partkey = l_partkey
            AND p_partkey = l_partkey
            AND o_orderkey = l_orderkey
            AND s_nationkey = n_nationkey
            AND like(p_name, '%green%')
    ) AS profit
GROUP BY
    nation,
    o_year
ORDER BY
    nation ASC,
    o_year DESC;

SELECT 10;

SELECT
    c_custkey,
    c_name,
    sum(l_extendedprice * ((1 - l_discount))) AS revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer
CROSS JOIN orders
CROSS JOIN lineitem
CROSS JOIN nation
WHERE c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= toDate('1993-10-01')
    AND o_orderdate < toDate('1993-10-01') + toIntervalMonth('3')
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment
ORDER BY revenue DESC
LIMIT 20;

SELECT 11;

SELECT
    ps_partkey,
    sum(ps_supplycost * ps_availqty) AS value
FROM
    partsupp
CROSS JOIN supplier
CROSS JOIN nation
WHERE ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
GROUP BY ps_partkey
HAVING sum(ps_supplycost * ps_availqty) > (
        SELECT sum(ps_supplycost * ps_availqty) * toDecimal64('0.0100000000', 2)
        FROM
            partsupp
        CROSS JOIN supplier
        CROSS JOIN nation
        WHERE ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
    )
ORDER BY value DESC;

SELECT 12;

SELECT
    l_shipmode,
    sum(multiIf(o_orderpriority = '1-URGENT'
    OR o_orderpriority = '2-HIGH', 1, 0)) AS high_line_count,
    sum(multiIf(o_orderpriority <> '1-URGENT'
    AND o_orderpriority <> '2-HIGH', 1, 0)) AS low_line_count
FROM
    orders
CROSS JOIN lineitem
WHERE o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= toDate('1994-01-01')
    AND l_receiptdate < toDate('1994-01-01') + toIntervalYear('1')
GROUP BY l_shipmode
ORDER BY l_shipmode ASC;

SELECT 13;

SELECT
    c_count,
    count(*) AS custdist
FROM (
        SELECT
            c_custkey,
            count(o_orderkey) AS c_count
        FROM
            customer
        LEFT JOIN orders
            ON c_custkey = o_custkey
            AND notLike(o_comment, '%special%requests%')
        GROUP BY c_custkey
    ) AS c_orders
GROUP BY c_count
ORDER BY
    custdist DESC,
    c_count DESC;

SELECT 14;

SELECT toDecimal32(100.00, 2) * sum(multiIf(like(p_type, 'PROMO%'), l_extendedprice * ((1 - l_discount)), 0)) / ((1 + sum(l_extendedprice * ((1 - l_discount))))) AS promo_revenue
FROM
    lineitem
CROSS JOIN part
WHERE l_partkey = p_partkey
    AND l_shipdate >= toDate('1995-09-01')
    AND l_shipdate < toDate('1995-09-01') + toIntervalMonth('1');

SELECT 15;

SELECT 16;

SELECT
    p_brand,
    p_type,
    p_size,
    countDistinct(ps_suppkey) AS supplier_cnt
FROM
    partsupp
CROSS JOIN part
WHERE p_partkey = ps_partkey
    AND p_brand <> 'Brand#45'
    AND notLike(p_type, 'MEDIUM POLISHED%')
    AND p_size IN (49, 14, 23, 45, 19, 3, 36, 9)
    AND ps_suppkey NOT IN (
        SELECT s_suppkey
        FROM supplier
        WHERE like(s_comment, '%Customer%Complaints%')
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    supplier_cnt DESC,
    p_brand ASC,
    p_type ASC,
    p_size ASC;

SELECT 17;

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
    );

SELECT 18;

SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    sum(l_quantity)
FROM
    customer
CROSS JOIN orders
CROSS JOIN lineitem
WHERE o_orderkey IN (
        SELECT l_orderkey
        FROM lineitem
        GROUP BY l_orderkey
        HAVING sum(l_quantity) > 300
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_totalprice DESC,
    o_orderdate ASC
LIMIT 100;

SELECT 19;

SELECT sum(l_extendedprice * ((1 - l_discount))) AS revenue
FROM
    lineitem
CROSS JOIN part
WHERE (p_partkey = l_partkey
    AND p_brand = 'Brand#12'
    AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
    AND l_quantity >= 1
    AND l_quantity <= 1 + 10
    AND and(greaterOrEquals(p_size, 1), lessOrEquals(p_size, 5))
    AND l_shipmode IN ('AIR', 'AIR REG')
    AND l_shipinstruct = 'DELIVER IN PERSON')
    OR (p_partkey = l_partkey
    AND p_brand = 'Brand#23'
    AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
    AND l_quantity >= 10
    AND l_quantity <= 10 + 10
    AND and(greaterOrEquals(p_size, 1), lessOrEquals(p_size, 10))
    AND l_shipmode IN ('AIR', 'AIR REG')
    AND l_shipinstruct = 'DELIVER IN PERSON')
    OR (p_partkey = l_partkey
    AND p_brand = 'Brand#34'
    AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
    AND l_quantity >= 20
    AND l_quantity <= 20 + 10
    AND and(greaterOrEquals(p_size, 1), lessOrEquals(p_size, 15))
    AND l_shipmode IN ('AIR', 'AIR REG')
    AND l_shipinstruct = 'DELIVER IN PERSON');

SELECT 20;

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
ORDER BY s_name ASC;

SELECT 21;

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
    AND exists((
        SELECT *
        FROM lineitem AS l2
        WHERE l2.l_orderkey = l1.l_orderkey
            AND l2.l_suppkey <> l1.l_suppkey
    ))
    AND NOT exists((
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
LIMIT 100;

SELECT 22;

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
            AND NOT exists((
                SELECT *
                FROM orders
                WHERE o_custkey = c_custkey
            ))
    ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode ASC;