CREATE TABLE t_reverse_order_virt_col
(
    order_0 Decimal(76, 53),
    p_time Date
)
ENGINE = MergeTree
ORDER BY order_0
PARTITION BY toYYYYMM(p_time);

SELECT DISTINCT _part
FROM (
        SELECT _part
        FROM t_reverse_order_virt_col
        ORDER BY order_0 DESC
    );