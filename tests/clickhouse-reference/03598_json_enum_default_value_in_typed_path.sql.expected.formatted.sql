SYSTEM drop  table if exists test;

CREATE TABLE test
(
    json JSON(e Enum('a' = 1, 'b' = 2))
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test;

SELECT json
FROM test;

SELECT json.e
FROM test;

SYSTEM drop  table test;