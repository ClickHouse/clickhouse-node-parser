SET asterisk_include_materialized_columns = 1 ;
CREATE TABLE elements
(
    `id` UInt32,
    `nested.key` Array(String),
    `nested.value` Array(String),
    `nested.key_hashed` Array(UInt64) MATERIALIZED arrayMap(x -> sipHash64(x), nested.key),
    `nested.val_hashed` Array(UInt64) MATERIALIZED arrayMap(x -> sipHash64(x), nested.value),
)
    ENGINE = Memory ;
SELECT * FROM elements ;
