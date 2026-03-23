SYSTEM drop  table if exists test;

CREATE TABLE test
(
    s String,
    json JSON MATERIALIZED s
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test SELECT '{"a" : 42}';

SELECT *
FROM test;

SYSTEM drop  table test;