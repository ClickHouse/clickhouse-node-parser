SET check_query_single_value_result = 0;

CREATE TABLE mt_table
(
    d Date,
    key UInt64,
    data String
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY toYYYYMM(d);