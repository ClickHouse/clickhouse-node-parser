SELECT CAST(1e38 AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(-1e38 AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(toFloat64(1e38) AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(toFloat32(1e38) AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(1e38 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(-1e38 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(1000.0 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(-1000.0 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(32768.0 AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(-32769.0 AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(128.0 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(-129.0 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(3.0 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(3.0 AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(1.0 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(2.0 AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(toFloat64(1) AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(toFloat32(2) AS Enum16('a' = 1, 'b' = 2));

SELECT CAST(1.5 AS Enum8('a' = 1, 'b' = 2));

SELECT CAST(1.9 AS Enum16('a' = 1, 'b' = 2));