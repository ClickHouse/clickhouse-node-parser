SELECT rankCorr(number, number)
FROM numbers(100);

SELECT rankCorr(number, -1 * CAST(number AS Int64))
FROM numbers(100);

SELECT roundBankers(rankCorr(exp(number), sin(number)), 3)
FROM numbers(100);

SELECT roundBankers(rankCorr(a, b), 3)
FROM moons;

SELECT roundBankers(rankCorr(a, b), 3)
FROM circles;