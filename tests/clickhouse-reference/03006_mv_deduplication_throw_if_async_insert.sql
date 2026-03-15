SET async_insert = 1;
SET deduplicate_blocks_in_dependent_materialized_views = 1;
CREATE TABLE 03006_test
(
    d Date,
    value UInt64
)
ENGINE = MergeTree ORDER BY tuple();
