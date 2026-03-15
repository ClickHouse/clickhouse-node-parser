CREATE TABLE t
(
    `product` Enum8('IU' = 1, 'WS' = 2),
    `machine` String,
    `branch` String,
    `generated_time` DateTime
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t', 'r1')
PARTITION BY (product, toYYYYMM(generated_time))
ORDER BY (product, machine, branch, generated_time);
SELECT product
FROM t
GROUP BY product
ORDER BY product;
