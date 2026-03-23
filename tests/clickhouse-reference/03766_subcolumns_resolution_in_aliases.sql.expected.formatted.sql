SET enable_analyzer = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    a JSON,
    `b.c` JSON,
    ab UInt64 ALIAS a.b,
    bcd UInt64 ALIAS b.c.d
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test SELECT
    '{"a" : 42}',
    '{"d" : 43}';

SELECT
    ab,
    bcd
FROM test;

SYSTEM drop  table test;