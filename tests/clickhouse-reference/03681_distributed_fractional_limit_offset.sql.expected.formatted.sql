SELECT number
FROM remote('127.0.0.{1,2,3}', numbers_mt(100))
ORDER BY number ASC
LIMIT 0.01;

SELECT number
FROM remote('127.0.0.{1,2,3}', numbers_mt(100))
ORDER BY number ASC
LIMIT 0.01
OFFSET 0.9;

SELECT number
FROM remote('127.0.0.{1,2,3}', numbers_mt(100))
ORDER BY number ASC
LIMIT 3
OFFSET 0.9;

SELECT number
FROM remote('127.0.0.{1,2,3}', numbers_mt(100))
ORDER BY number ASC
LIMIT 0.01
OFFSET 297;

SELECT
    0 AS `0`,
    18 AS `18`,
    __table1.k AS k
FROM test__fuzz_2_dist AS __table1
PREWHERE _CAST(11, 'Nullable(UInt8)')
ORDER BY __table1.k DESC
LIMIT 0.9999, _CAST(100, 'UInt64');