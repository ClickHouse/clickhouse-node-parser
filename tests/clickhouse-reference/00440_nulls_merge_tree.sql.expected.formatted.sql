SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE `nulls`
(
    d Date,
    x Nullable(UInt64)
)
ENGINE = MergeTree(d, d, 8192);

SELECT count()
FROM `nulls`
WHERE isNull(x);