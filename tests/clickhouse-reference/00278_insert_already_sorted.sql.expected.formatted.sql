SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE sorted
(
    d Date DEFAULT '2000-01-01',
    x UInt64
)
ENGINE = MergeTree(d, x, 8192);

SET max_threads = 1;

SELECT count()
FROM sorted;

SELECT x
FROM (
        SELECT DISTINCT x
        FROM sorted
    )
ORDER BY x ASC;