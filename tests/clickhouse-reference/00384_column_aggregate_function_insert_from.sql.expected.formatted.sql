SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE aggregates
(
    d Date,
    s AggregateFunction(uniq, UInt64)
)
ENGINE = MergeTree(d, d, 8192);

SELECT
    d,
    uniqMerge(s)
FROM aggregates
GROUP BY d
ORDER BY d ASC;