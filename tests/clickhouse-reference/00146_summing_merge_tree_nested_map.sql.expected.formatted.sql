SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE nested_map
(
    d DEFAULT today(),
    k UInt64,
    payload DEFAULT rand(),
    SomeMap Nested(ID UInt32, Num Int64)
)
ENGINE = SummingMergeTree(d, k, 8192);

SELECT
    `SomeMap.ID`,
    `SomeMap.Num`
FROM nested_map;

CREATE TABLE nested_map
(
    d DEFAULT today(),
    k UInt64,
    payload DEFAULT rand(),
    SomeMap Nested(ID String, Num Int64)
)
ENGINE = SummingMergeTree(d, k, 8192);

CREATE TABLE nested_map_explicit
(
    d DEFAULT today(),
    k UInt64,
    SomeIntExcluded UInt32,
    SomeMap Nested(ID UInt32, Num Int64)
)
ENGINE = SummingMergeTree(d, k, 8192, (SomeMap));

SELECT
    SomeIntExcluded,
    `SomeMap.ID`,
    `SomeMap.Num`
FROM nested_map_explicit;