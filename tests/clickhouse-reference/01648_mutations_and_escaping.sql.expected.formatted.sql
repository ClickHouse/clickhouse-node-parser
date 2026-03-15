SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE mutations_and_escaping_1648
(
    d Date,
    e Enum8('foo'=1, 'bar'=2)
)
ENGINE = MergeTree(d, (d), 8192);

SELECT e
FROM mutations_and_escaping_1648
ORDER BY d ASC;