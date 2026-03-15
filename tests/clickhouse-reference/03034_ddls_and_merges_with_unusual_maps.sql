-- Tests maps with "unusual" key types (Float32, Nothing, LowCardinality(String))

SET mutations_sync = 2;
SELECT 'Map(Nothing, ...) is non-comparable --> not usable as primary key';
CREATE TABLE tab (m1 Map(String, AggregateFunction(sum, UInt32))) ENGINE = MergeTree ORDER BY m1; -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
CREATE TABLE tab (m3 Map(Nothing, String)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE tab (m1 Map(Float32, String), m2 Map(LowCardinality(String), String)) ENGINE = MergeTree ORDER BY (m1, m2);
SELECT * FROM tab ORDER BY m1, m2;
CREATE TABLE tab (m1 Map(Float32, String), m2 Map(LowCardinality(String), String)) ENGINE = MergeTree ORDER BY tuple();
