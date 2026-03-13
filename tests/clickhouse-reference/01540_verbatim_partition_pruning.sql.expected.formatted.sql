SELECT *
FROM xy
WHERE intHash64(x) % 2 = intHash64(2) % 2;

-- Equality is another special operator that can be treated as an always monotonic indicator for deterministic functions.
-- minmax index is not enough.
SELECT *
FROM xy
WHERE x = 8;

SELECT *
FROM xyz
WHERE y = 2;

SELECT *
FROM test
WHERE d != '2020-01-01';

SELECT *
FROM myTable AS mt
WHERE myDay = '2021-01-02';