CREATE TABLE mem_test
(
    a Int64,
    b Int64
)
ENGINE = Memory;

SET max_block_size = 3;

SELECT *
FROM mem_test
FORMAT Null;