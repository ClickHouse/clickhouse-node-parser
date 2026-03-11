SELECT *
FROM distributed_01099_b;

SELECT
    number,
    count(number)
FROM local_01099_b
GROUP BY number
ORDER BY number ASC;

SELECT
    number,
    count(number)
FROM distributed_01099_b
GROUP BY number
ORDER BY number ASC;

SELECT *
FROM distributed_01099_c;