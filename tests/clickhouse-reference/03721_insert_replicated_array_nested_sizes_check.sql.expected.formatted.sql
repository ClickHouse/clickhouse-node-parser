SET enable_analyzer = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    a Array(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test SELECT range(number)
FROM
    numbers(3)
ARRAY JOIN range(number + 1);

SELECT *
FROM test;

SYSTEM drop  table test;