SYSTEM drop  table if exists test;

CREATE TABLE test
(
    str Nullable(String),
    i Int64
)
ENGINE = Memory();

INSERT INTO test;

SELECT '-----------String------------';

SELECT
    str,
    max(i)
FROM test
GROUP BY str
ORDER BY str ASC;

SYSTEM drop  table test;