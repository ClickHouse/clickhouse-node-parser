SET enable_json_type = 1;

SET enable_dynamic_type = 1;

SYSTEM drop  table if exists src;

SYSTEM drop  table if exists dst;

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

INSERT INTO src SELECT materialize(42)::Int64;

INSERT INTO src SELECT 'Hello';

INSERT INTO dst SELECT *
FROM remote('127.0.0.2', currentDatabase(), src);

SELECT isDynamicElementInSharedData(d)
FROM dst;

SYSTEM drop  table src;

SYSTEM drop  table dst;

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

INSERT INTO src SELECT '{"a" : 42}';

INSERT INTO src SELECT '{"b" : 42}';

SELECT JSONSharedDataPaths(json)
FROM dst;