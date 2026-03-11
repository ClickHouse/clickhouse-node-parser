SELECT
    number,
    COUNT() OVER (PARTITION BY number % 3) AS partition_count
FROM numbers(10)
ORDER BY number ASC
QUALIFY partition_count = 4;

SELECT '--';

SELECT number
FROM numbers(10)
ORDER BY number ASC
QUALIFY ((COUNT() OVER (PARTITION BY number % 3) AS partition_count)) = 4;

SELECT number
FROM numbers(10)
ORDER BY number ASC
QUALIFY number > 5;

SELECT
    (number % 2) AS key,
    count()
FROM numbers(10)
GROUP BY key
HAVING key = 0
QUALIFY key == 0;

SELECT
    (number % 2) AS key,
    count()
FROM numbers(10)
GROUP BY key
QUALIFY key == 0;

SELECT
    number,
    COUNT() OVER (PARTITION BY number % 3) AS partition_count
FROM numbers(10)
ORDER BY number ASC
QUALIFY COUNT() OVER (PARTITION BY number % 3) = 4;

SELECT
    number % toUInt256(2) AS key,
    count()
FROM numbers(10)
GROUP BY key
WITH CUBE
WITH TOTALS
QUALIFY key = toNullable(toNullable(0));

SELECT
    number % 2 AS key,
    count(materialize(5))
FROM numbers(10)
WHERE toLowCardinality(toLowCardinality(materialize(2)))
GROUP BY key
WITH CUBE
WITH TOTALS
QUALIFY key = 0;

SELECT
    4,
    count(4),
    number % 2 AS key
FROM numbers(10)
GROUP BY key
WITH ROLLUP
WITH TOTALS
QUALIFY key = materialize(0);

SELECT
    3,
    number % toLowCardinality(2) AS key,
    count()
FROM numbers(10)
GROUP BY key
WITH ROLLUP
WITH TOTALS
QUALIFY key = 0;