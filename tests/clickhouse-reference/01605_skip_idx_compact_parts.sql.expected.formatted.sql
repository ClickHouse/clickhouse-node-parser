CREATE TABLE skip_idx_comp_parts
(
    a Int,
    b Int,
    INDEX b_idx b TYPE minmax GRANULARITY 4
)
ENGINE = MergeTree
ORDER BY a
SETTINGS index_granularity = 256, index_granularity_bytes = '10Mi', merge_max_block_size = 100;

INSERT INTO skip_idx_comp_parts SELECT
    number,
    number
FROM numbers(200);

SELECT count()
FROM skip_idx_comp_parts
WHERE b > 100;