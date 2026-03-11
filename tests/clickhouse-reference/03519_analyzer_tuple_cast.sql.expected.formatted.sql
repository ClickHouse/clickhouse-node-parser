SELECT
    count(),
    plus((-9, 0), (number,  number)) AS k
FROM remote('127.0.0.{3,2}', numbers(2))
GROUP BY k
ORDER BY k ASC;

SELECT
    count(),
    mapAdd(map(1::UInt128, 1), map(1::UInt128, number)) AS k
FROM remote('127.0.0.{3,2}', numbers(2))
GROUP BY k
ORDER BY k ASC;

SELECT transform(s, ['a', 'b'], [(1, 2), (3, 4)], (0, 0)) AS k
FROM test
ORDER BY k ASC;

SELECT if(s != '', (1,2), (0,0)) AS k
FROM test
ORDER BY k ASC;

SELECT
    id,
    tuple(replaceAll(data, 'a', 'e') AS col_a, type) AS a,
    tuple(replaceAll(data, 'a', 'e') AS col_b, type) AS b
FROM src;