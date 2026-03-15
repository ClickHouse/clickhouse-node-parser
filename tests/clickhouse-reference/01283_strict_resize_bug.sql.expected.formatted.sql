CREATE TABLE num_10m
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM (
        SELECT sum(number)
        FROM num_10m
        UNION ALL
        SELECT sum(number)
        FROM num_10m
    )
LIMIT 1
SETTINGS max_block_size = 1024;