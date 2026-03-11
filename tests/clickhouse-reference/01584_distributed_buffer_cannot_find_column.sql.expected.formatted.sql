SELECT sum(amount) = 100
FROM realtimebuff;

SELECT sum(amount) IN (0, 100, 200)
FROM realtimebuff;

SELECT sum(amount) = 200
FROM realtimebuff;