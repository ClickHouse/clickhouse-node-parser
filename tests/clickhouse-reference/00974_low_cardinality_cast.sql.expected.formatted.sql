SELECT CAST('Hello' AS LowCardinality(Nullable(String)));

SELECT CAST(NULL AS LowCardinality(Nullable(String)));

SELECT CAST(CAST('Hello' AS LowCardinality(Nullable(String))) AS String);

SELECT CAST(CAST(NULL AS LowCardinality(Nullable(String))) AS String);

SELECT CAST(CAST('Hello' AS Nullable(String)) AS String);

SELECT CAST(CAST(NULL AS Nullable(String)) AS String);