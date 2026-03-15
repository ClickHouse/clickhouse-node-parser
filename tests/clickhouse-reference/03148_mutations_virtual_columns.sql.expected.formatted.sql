CREATE TABLE t_mut_virtuals
(
    id UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY id;

SET insert_keeper_fault_injection_probability = 0;

SET mutations_sync = 2;

SELECT *
FROM t_mut_virtuals
ORDER BY id ASC;