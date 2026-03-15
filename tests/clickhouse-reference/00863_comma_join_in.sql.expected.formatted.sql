CREATE TABLE test1_00863
(
    id UInt64,
    code String
)
ENGINE = Memory;

CREATE TABLE test3_00863
(
    id UInt64,
    code String
)
ENGINE = Memory;

CREATE TABLE test2_00863
(
    id UInt64,
    code String,
    test1_id UInt64,
    test3_id UInt64
)
ENGINE = Memory;

-- `parallel_hash` uses two-level hash tables (that have 256 tables internally), each preallocates 256 elements by default,
-- so we're getting max_threads * 256 * 256 * number_of_joins 
SET max_memory_usage = 300000000;

SELECT test2_00863.id
FROM
    test1_00863
CROSS JOIN test2_00863
CROSS JOIN test3_00863
WHERE test1_00863.code IN ('1', '2', '3')
    AND test2_00863.test1_id = test1_00863.id
    AND test2_00863.test3_id = test3_00863.id
ORDER BY `all` ASC;