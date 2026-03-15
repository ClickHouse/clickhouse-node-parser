CREATE TABLE nums_in_mem
(
    v UInt64
)
ENGINE = Memory;

CREATE TABLE nums_in_mem_dist AS nums_in_mem
ENGINE = Distributed('test_shard_localhost', currentDatabase(), nums_in_mem);

SET prefer_localhost_replica = 0;

SET max_rows_to_read = 100;

SELECT count() / (
        SELECT count()
        FROM nums_in_mem_dist
        WHERE rand() > 0
    )
FROM `system`.one; -- { serverError TOO_MANY_ROWS }