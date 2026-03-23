WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'x') AS a,

concat(prefix, 'y') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'y') AS a,

concat(prefix, 'x') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'x') AS a,

concat(prefix, 'x') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'x', prefix) AS a,

concat(prefix, 'y', prefix) AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'y', prefix) AS a,

concat(prefix, 'x', prefix) AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'x', prefix) AS a,

concat(prefix, 'x', prefix) AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'x', prefix) AS a,

concat(prefix, 'y') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'y', prefix) AS a,

concat(prefix, 'x') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH substring('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, number) AS prefix,

concat(prefix, 'x', prefix) AS a,

concat(prefix, 'x') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b
FROM numbers(40);

WITH arrayJoin(['aaa', 'bbb']) AS a,

'aaa\0bbb' AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b;

WITH arrayJoin(['aaa', 'zzz']) AS a,

'aaa\0bbb' AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b;

WITH arrayJoin(['aaa', 'bbb']) AS a,

materialize('aaa\0bbb') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b;

WITH arrayJoin(['aaa', 'zzz']) AS a,

materialize('aaa\0bbb') AS b

SELECT
    a = b,
    a < b,
    a > b,
    a <= b,
    a >= b;

SELECT empty(toFixedString('', 1 + randConstant() % 100));