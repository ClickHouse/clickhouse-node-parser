set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE stored_aggregates
(
    d Date,
    Uniq AggregateFunction(uniq, UInt64)
)
ENGINE = AggregatingMergeTree(d, d, 8192);
SELECT uniqMerge(Uniq) FROM stored_aggregates;
