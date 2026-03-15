SET enable_analyzer = 1;

SELECT concat(materialize(toLowCardinality('b')), 'a')
FROM remote('127.0.0.{1,2}', `system`, one)
GROUP BY 'a';

SELECT concat(NULLIF(1, materialize(toLowCardinality(1))), concat(NULLIF(1, 1)))
FROM remote('127.0.0.{1,2}', `system`, one)
GROUP BY concat(NULLIF(1, 1));

CREATE TABLE test__fuzz_21
(
    x Decimal(18, 10)
)
ENGINE = MergeTree
ORDER BY x;