SELECT
    cityHash64(rand() % 1000) AS n,
    groupBitmapState(number)
FROM numbers_mt(200000000)
GROUP BY n
FORMAT Null;