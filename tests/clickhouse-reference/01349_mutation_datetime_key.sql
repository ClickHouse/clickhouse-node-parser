CREATE TABLE cdp_orders
(
    `order_id` String,
    `order_status` String,
    `order_time` DateTime
)
ENGINE = ReplacingMergeTree()
PARTITION BY toYYYYMMDD(order_time)
ORDER BY (order_time, order_id)
SETTINGS index_granularity = 8192;
SELECT * FROM cdp_orders;
SET mutations_sync = 1;
