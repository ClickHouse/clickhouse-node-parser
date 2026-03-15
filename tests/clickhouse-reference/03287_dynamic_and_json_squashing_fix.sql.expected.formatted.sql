SET enable_json_type = 1;

SET enable_dynamic_type = 1;

CREATE TABLE src
(
    d Dynamic
)
ENGINE = Memory;

CREATE TABLE dst
(
    d Dynamic
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT isDynamicElementInSharedData(d)
FROM dst;

CREATE TABLE src
(
    json JSON
)
ENGINE = Memory;

CREATE TABLE dst
(
    json JSON
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT JSONSharedDataPaths(json)
FROM dst;