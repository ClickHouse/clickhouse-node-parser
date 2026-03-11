SELECT CAST(CAST(NULL AS Nullable(String)) AS Nullable(Enum8('Hello' = 1)));

SELECT CAST(CAST(NULL AS Nullable(FixedString(1))) AS Nullable(Enum8('Hello' = 1)));

SELECT CAST(CAST('' AS Nullable(String)) AS Nullable(Enum8('Hello' = 1)));

SELECT CAST(CAST('' AS Nullable(FixedString(1))) AS Nullable(Enum8('Hello' = 1)));

SELECT CAST(CAST(NULL AS Nullable(String)) AS Enum8('Hello' = 1));

SELECT CAST(CAST(NULL AS Nullable(FixedString(1))) AS Enum8('Hello' = 1));