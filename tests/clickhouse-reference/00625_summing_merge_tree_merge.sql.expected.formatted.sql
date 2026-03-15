SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE tab_00625
(
    date Date,
    key UInt32,
    testMap Nested(
    k UInt16,
    v UInt64)
)
ENGINE = SummingMergeTree(date, (date, key), 1);