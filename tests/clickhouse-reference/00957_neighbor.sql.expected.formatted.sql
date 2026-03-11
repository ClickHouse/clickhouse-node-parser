SELECT neighbor();

SELECT neighbor(1);

SELECT neighbor(1, 2, 3, 4);

SELECT neighbor(dummy, 1, 'hello');

SELECT
    number,
    neighbor(number, 1, -10)
FROM numbers(3);

SELECT
    number,
    if(number > 1, number, NULL) AS `offset`,
    neighbor(number, `offset`)
FROM numbers(3);

SELECT
    number,
    neighbor(number, 0)
FROM numbers(3);

SELECT
    if(number > 1, number, NULL) AS value,
    number AS `offset`,
    neighbor(value, `offset`) AS neighbor
FROM numbers(3);

SELECT
    toInt32(number) AS n,
    neighbor(n, 1, -10)
FROM numbers(3);

SELECT
    number,
    neighbor(number, 10)
FROM numbers(3);

SELECT
    number,
    neighbor(number, -10)
FROM numbers(3);

SELECT
    number,
    neighbor(number, 1)
FROM numbers(3);

SELECT
    number,
    neighbor(number, 2, number + 10)
FROM numbers(4);

SELECT
    number,
    neighbor(number, -2, number + 10)
FROM numbers(4);

SELECT
    number,
    neighbor(number, 1, 1000)
FROM numbers(3);

SELECT
    number,
    neighbor(number, -1, 1000)
FROM numbers(3);

SELECT
    number,
    number * 2 AS `offset`,
    neighbor(number, `offset`, number * 10)
FROM numbers(4);

SELECT
    number,
    negate(number) * 2 AS `offset`,
    neighbor(number, `offset`, number * 10)
FROM numbers(6);

SELECT
    number,
    negate((number - 2)) * 2 AS `offset`,
    neighbor(number, `offset`)
FROM numbers(6);

SELECT
    number,
    neighbor(1000, 10)
FROM numbers(3);