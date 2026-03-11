SELECT
    bitAnd(number, toUInt64(pow(2, 20) - 1)) AS k,
    argMaxIf(k, if(number % 2 = 0, number, NULL), number > 42),
    uniq(number) AS u
FROM numbers(1000000)
GROUP BY k
FORMAT Null;