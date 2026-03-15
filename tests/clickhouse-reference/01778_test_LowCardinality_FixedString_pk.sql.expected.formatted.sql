SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE test_01778
(
    key LowCardinality(FixedString(3)),
    d date
)
ENGINE = MergeTree(d, key, 8192);

SELECT count()
FROM test_01778
WHERE key = 'xxx';

SELECT count()
FROM test_01778
WHERE key = toFixedString('xxx', 3);

SELECT count()
FROM test_01778
WHERE toString(key) = 'xxx';