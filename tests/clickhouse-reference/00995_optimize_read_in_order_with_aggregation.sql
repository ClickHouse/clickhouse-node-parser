SET optimize_read_in_order = 1;
CREATE TABLE order_with_aggr(a Int) ENGINE = MergeTree ORDER BY a;
SELECT sum(a) as s FROM order_with_aggr ORDER BY s;
