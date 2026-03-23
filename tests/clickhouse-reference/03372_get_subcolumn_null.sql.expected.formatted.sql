SYSTEM drop  table if exists test;

CREATE TABLE test
(
    x Nullable(UInt32)
)
ENGINE = Memory;

INSERT INTO test SELECT if(number % 2, NULL, number)
FROM numbers(10);

SELECT getSubcolumn(x, 'null')
FROM test;

SYSTEM drop  table test;