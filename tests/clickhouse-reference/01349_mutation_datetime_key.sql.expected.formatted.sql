DROP TABLE IF EXISTS cdp_orders;

CREATE TABLE cdp_orders
(
    order_id String,
    order_status String,
    order_time DateTime
)
ENGINE = ReplacingMergeTree()
ORDER BY (order_time, order_id)
PARTITION BY toYYYYMMDD(order_time)
SETTINGS index_granularity = 8192;

INSERT INTO cdp_orders;

SELECT *
FROM cdp_orders;

SET mutations_sync = 1;

DROP TABLE cdp_orders;