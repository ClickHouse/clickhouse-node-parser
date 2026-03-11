SELECT
    accurateCastOrDefault(variant, 'UInt32'),
    multiIf(number % 4 == 0, NULL, number % 4 == 1, number, number % 4 == 2, concat('str_', toString(number)), range(number)) AS variant
FROM numbers(8);

SELECT
    accurateCastOrNull(variant, 'UInt32'),
    multiIf(number % 4 == 0, NULL, number % 4 == 1, number, number % 4 == 2, concat('str_', toString(number)), range(number)) AS variant
FROM numbers(8);

SELECT
    accurateCastOrDefault(dynamic, 'UInt32'),
    multiIf(number % 4 == 0, NULL, number % 4 == 1, number, number % 4 == 2, concat('str_', toString(number)), range(number))::Dynamic AS dynamic
FROM numbers(8);

SELECT
    accurateCastOrNull(dynamic, 'UInt32'),
    multiIf(number % 4 == 0, NULL, number % 4 == 1, number, number % 4 == 2, concat('str_', toString(number)), range(number))::Dynamic AS dynamic
FROM numbers(8);

SELECT DISTINCT toInt8OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toUInt8OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toInt16OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toUInt16OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toInt32OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toUInt32OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toInt64OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toUInt64OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toInt128OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toUInt128OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toInt256OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toUInt256OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toFloat32OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toFloat64OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toDecimal32OrDefault(d, 3) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toDecimal64OrDefault(d, 3) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toDecimal128OrDefault(d, 3) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toDecimal256OrDefault(d, 3) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toDateOrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toDate32OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toDateTimeOrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toIPv4OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toIPv6OrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT DISTINCT toUUIDOrDefault(d) AS res
FROM t
ORDER BY res ASC;

SELECT d
FROM t
ORDER BY id ASC;