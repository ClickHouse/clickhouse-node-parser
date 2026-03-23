SYSTEM drop  table if exists nested_map;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE nested_map
(
    d DEFAULT today(),
    k UInt64,
    payload DEFAULT rand(),
    SomeMap Nested(ID UInt32, Num Int64)
)
ENGINE = SummingMergeTree(d, k, 8192);

INSERT INTO nested_map (k, `SomeMap.ID`, `SomeMap.Num`);

INSERT INTO nested_map (k, `SomeMap.ID`, `SomeMap.Num`);

SELECT
    `SomeMap.ID`,
    `SomeMap.Num`
FROM nested_map;

SYSTEM drop  table nested_map;

CREATE TABLE nested_map
(
    d DEFAULT today(),
    k UInt64,
    payload DEFAULT rand(),
    SomeMap Nested(ID String, Num Int64)
)
ENGINE = SummingMergeTree(d, k, 8192);

INSERT INTO nested_map (k, `SomeMap.ID`, `SomeMap.Num`);

INSERT INTO nested_map (k, `SomeMap.ID`, `SomeMap.Num`);

SYSTEM drop  table if exists nested_map_explicit;

CREATE TABLE nested_map_explicit
(
    d DEFAULT today(),
    k UInt64,
    SomeIntExcluded UInt32,
    SomeMap Nested(ID UInt32, Num Int64)
)
ENGINE = SummingMergeTree(d, k, 8192, (SomeMap));

INSERT INTO nested_map_explicit (k, SomeIntExcluded, `SomeMap.ID`, `SomeMap.Num`);

INSERT INTO nested_map_explicit (k, SomeIntExcluded, `SomeMap.ID`, `SomeMap.Num`);

SELECT
    SomeIntExcluded,
    `SomeMap.ID`,
    `SomeMap.Num`
FROM nested_map_explicit;

SYSTEM drop  table nested_map_explicit;