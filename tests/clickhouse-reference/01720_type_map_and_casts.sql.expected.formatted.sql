SELECT m
FROM table_map_with_key_integer;

SELECT
    m[127],
    m[1],
    m[0],
    m[-1]
FROM table_map_with_key_integer;

SELECT m[toInt8(number - 2)]
FROM
    table_map_with_key_integer
ARRAY JOIN [0, 1, 2, 3, 4] AS number;

SELECT count()
FROM table_map_with_key_integer
WHERE m = map();

SELECT
    m[-1],
    m[2147483647],
    m[-2147483648]
FROM table_map_with_key_integer;

SELECT m[toInt32(number - 2)]
FROM
    table_map_with_key_integer
ARRAY JOIN [0, 1, 2, 3, 4] AS number;

SELECT
    m[toDate('2020-01-01')],
    m[toDate('2020-01-02')],
    m[toDate('2020-01-03')]
FROM table_map_with_key_integer;

SELECT m[toDate(number)]
FROM
    table_map_with_key_integer
ARRAY JOIN [0, 1, 2] AS number;

SELECT
    m[toUUID('00001192-0000-4000-6000-000000000001')],
    m[toUUID('00001192-0000-4000-7000-000000000001')],
    m[toUUID('00001192-0000-4000-8000-000000000001')]
FROM table_map_with_key_integer;

SELECT
    m[257],
    m[1]
FROM table_map_with_key_integer; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT
    m[toInt128(-1)],
    m[toInt128(0)],
    m[toInt128('1234567898765432123456789')],
    m[toInt128('-1234567898765432123456789')]
FROM table_map_with_key_integer;

SELECT m[toInt128(number - 2)]
FROM
    table_map_with_key_integer
ARRAY JOIN [0, 1, 2, 3] AS number;

SELECT
    m[-1],
    m[0],
    m[toInt128('1234567898765432123456789')],
    m[toInt128('-1234567898765432123456789')]
FROM table_map_with_key_integer;

SELECT
    m[toUInt64(0)],
    m[toInt64(0)],
    m[toUInt8(0)],
    m[toUInt16(0)]
FROM table_map_with_key_integer;