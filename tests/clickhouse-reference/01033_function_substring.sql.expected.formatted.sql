SELECT '-- argument validation';

SELECT substring('hello', []);

SELECT substring('hello', 1, []);

SELECT substring(materialize('hello'), -1, -1);

SELECT substring(materialize('hello'), 0);

SELECT substring(toFixedString('hello', 16), 1, 8);

SELECT substring(toFixedString(materialize('hello'), 16), 1, 8);

SELECT substring(toFixedString(toString(number), 16), 1, 8)
FROM `system`.numbers
LIMIT 10;

SELECT substring(toFixedString(toString(number), 4), 1, 3)
FROM `system`.numbers
LIMIT 995, 10;

SELECT substring(toFixedString(toString(number), 4), 1, number % 5)
FROM `system`.numbers
LIMIT 995, 10;

SELECT substring(toFixedString(toString(number), 4), 1 + number % 5)
FROM `system`.numbers
LIMIT 995, 10;

SELECT substring(toFixedString(toString(number), 4), 1 + number % 5, 1 + number % 3)
FROM `system`.numbers
LIMIT 995, 10;

SELECT
    substring(e8, 1),
    substring(e16, 1)
FROM tab;

SELECT
    substring(e8, 2, 10),
    substring(e16, 2, 10)
FROM tab;

SELECT
    substring(e8, -1),
    substring(e16, -1)
FROM tab;

SELECT
    substring(e8, -2, 10),
    substring(e16, -2, 10)
FROM tab;

SELECT
    substring(e8, 1, 0),
    substring(e16, 1, 0)
FROM tab;

SELECT
    substring(CAST('foo', 'Enum8(''foo'' = 1)'), 1, 1),
    substring(CAST('foo', 'Enum16(''foo'' = 1111)'), 1, 2);

SELECT substring('abc', number - 5)
FROM `system`.numbers
LIMIT 10;

SELECT substring(materialize('abc'), number - 5)
FROM `system`.numbers
LIMIT 10;

SELECT substring(toFixedString('abc', 3), number - 5)
FROM `system`.numbers
LIMIT 10;

SELECT substring(materialize(toFixedString('abc', 3)), number - 5)
FROM `system`.numbers
LIMIT 10;

SELECT substring('clickhouse', 2, -2);

SELECT substring(materialize('clickhouse'), 2, -2);

SELECT substring('clickhouse', materialize(2), -2);

SELECT substring(materialize('clickhouse'), materialize(2), -2);

SELECT substring('clickhouse', 2, materialize(-2));

SELECT substring(materialize('clickhouse'), 2, materialize(-2));

SELECT substring('clickhouse', materialize(2), materialize(-2));

SELECT substring(materialize('clickhouse'), materialize(2), materialize(-2));

SELECT substring('abcdefgh', 2, -2);

SELECT substring('abcdefgh', materialize(2), -2);

SELECT substring('abcdefgh', 2, materialize(-2));

SELECT substring('abcdefgh', materialize(2), materialize(-2));

SELECT substring(CAST('abcdefgh' AS FixedString(8)), 2, -2);

SELECT substring(CAST('abcdefgh' AS FixedString(8)), materialize(2), -2);

SELECT substring(CAST('abcdefgh' AS FixedString(8)), 2, materialize(-2));

SELECT substring(CAST('abcdefgh' AS FixedString(8)), materialize(2), materialize(-2));

SELECT substring(s, 2, -2)
FROM tab;

SELECT substring(s, l, -2)
FROM tab;

SELECT substring(s, 2, r)
FROM tab;

SELECT substring(s, l, r)
FROM tab;

SELECT substring('abcdefgh', -2, -2);

SELECT substring(materialize('abcdefgh'), -2, -2);

SELECT substring(materialize('abcdefgh'), materialize(-2), materialize(-2));

SELECT substring('abcdefgh', -2, -1);

SELECT substring(materialize('abcdefgh'), -2, -1);

SELECT substring(materialize('abcdefgh'), materialize(-2), materialize(-1));

SELECT substring(CAST('abcdefgh' AS FixedString(8)), -2, -2);

SELECT substring(materialize(CAST('abcdefgh' AS FixedString(8))), -2, -2);

SELECT substring(materialize(CAST('abcdefgh' AS FixedString(8))), materialize(-2), materialize(-2));

SELECT substring(CAST('abcdefgh' AS FixedString(8)), -2, -1);

SELECT substring(materialize(CAST('abcdefgh' AS FixedString(8))), -2, -1);

SELECT substring(materialize(CAST('abcdefgh' AS FixedString(8))), materialize(-2), materialize(-1));

SELECT substring(s, -2, -2)
FROM t;

SELECT substring(s, l, -2)
FROM t;

SELECT substring(s, -2, r)
FROM t;

SELECT substring(s, l, r)
FROM t;

SELECT substringUTF8('hello, Ð¿Ñ�Ð¸Ð²ÐµÑ�', -9223372036854775808, number)
FROM numbers(16)
FORMAT Null;

SELECT byteSlice('hello', 2, 2);