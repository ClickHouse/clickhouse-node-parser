SELECT number
FROM numbers(10)
LIMIT 0 + 1;

SELECT number
FROM numbers(10)
LIMIT 1 - 1;

SELECT number
FROM numbers(10)
LIMIT 2 - 1;

SELECT number
FROM numbers(10)
LIMIT 0 - 1;

SELECT number
FROM numbers(10)
LIMIT 1.0;

SELECT number
FROM numbers(10)
LIMIT 1.5;

SELECT number
FROM numbers(10)
LIMIT '1';

SELECT number
FROM numbers(10)
LIMIT now();

SELECT number
FROM numbers(10)
LIMIT today();

SELECT number
FROM numbers(10)
LIMIT toUInt8('1');

SELECT number
FROM numbers(10)
LIMIT toFloat32('1');

SELECT number
FROM numbers(10)
LIMIT rand();

SELECT count() <= 1
FROM (
        SELECT number
        FROM numbers(10)
        LIMIT randConstant() % 2
    );

SELECT number
FROM numbers(10)
LIMIT 0 + 1 BY number;

SELECT number
FROM numbers(10)
LIMIT 0 BY number;

SELECT *
FROM numbers(10)
LIMIT 5;

SELECT *
FROM numbers(10)
LIMIT 0.33 / 0.165 - 0.33 + 0.67;

SELECT *
FROM numbers(10)
LIMIT LENGTH('NNN') + COS(0), toDate('0000-00-02');

SELECT *
FROM numbers(10)
LIMIT a + 5 - a;

SELECT *
FROM numbers(10)
LIMIT a + b;

SELECT *
FROM numbers(10)
LIMIT 'Hello';

SELECT number
FROM numbers(10)
ORDER BY number ASC
LIMIT (
    SELECT
        sum(number),
        count()
    FROM numbers(3)
).1;