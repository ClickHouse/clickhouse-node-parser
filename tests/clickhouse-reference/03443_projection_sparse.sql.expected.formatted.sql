CREATE TABLE t_projection_sparse
(
    id String,
    val AggregateFunction(sum, UInt64),
    PROJECTION projection_traces_by_id (    SELECT
        id,
        finalizeAggregation(val)
    ORDER BY finalizeAggregation(val) ASC)
)
ENGINE = AggregatingMergeTree
ORDER BY id
SETTINGS deduplicate_merge_projection_mode = 'rebuild', index_granularity = 1;

SELECT count()
FROM t_projection_sparse
WHERE finalizeAggregation(val) = 0;