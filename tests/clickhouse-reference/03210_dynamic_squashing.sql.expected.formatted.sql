-- Tags: long
-- Random settings limits: index_granularity=(100, None)
SET allow_experimental_dynamic_type = 1;

SET max_block_size = 1000;

CREATE TABLE test
(
    d Dynamic
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT DISTINCT
    dynamicType(d) AS type,
    isDynamicElementInSharedData(d) AS flag
FROM test
ORDER BY type ASC;

CREATE TABLE test
(
    d Dynamic(max_types=1)
)
ENGINE = MergeTree
ORDER BY tuple();