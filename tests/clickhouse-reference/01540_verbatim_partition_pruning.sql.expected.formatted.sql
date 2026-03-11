SELECT *
FROM xy
WHERE intHash64(x) % 2 = intHash64(2) % 2;

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