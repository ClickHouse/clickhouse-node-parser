SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE t_00575
(
    d Date
)
ENGINE = MergeTree(d, d, 8192);

SELECT count()
FROM t_00575
WHERE toDayOfWeek(d) IN (2);