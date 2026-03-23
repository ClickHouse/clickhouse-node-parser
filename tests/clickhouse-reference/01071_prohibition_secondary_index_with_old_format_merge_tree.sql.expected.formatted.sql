SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE old_syntax_01071_test
(
    date Date,
    id UInt8
)
ENGINE = MergeTree(date, id, 8192);

CREATE TABLE new_syntax_01071_test
(
    date Date,
    id UInt8
)
ENGINE = MergeTree()
ORDER BY id;

SYSTEM DROP  TABLE IF EXISTS old_syntax_01071_test;

SYSTEM DROP  TABLE IF EXISTS new_syntax_01071_test;