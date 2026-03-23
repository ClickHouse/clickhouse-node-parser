CREATE TABLE uin_value_details (uin UInt8, value Float64) ENGINE = MergeTree() ORDER BY uin;
INSERT INTO uin_value_details (uin, value) values (1, 7.3), (2, 8.3), (3, 0), (4, 0), (5, 0), (6, 100.6543782), (7, 0);
INSERT INTO uin_value_details (uin, value) values (1, 7.3), (2, 8.3), (3, 0), (4, 0), (5, 0), (6, 100.6543782), (7, inf);
-- https://github.com/ClickHouse/ClickHouse/issues/82239
SELECT 'Test with NaN, INFs and Nulls' AS test;
SELECT groupNumericIndexedVector(x, y) FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, nan), (3, 2), (0, 0), (5, 1)); -- { serverError INCORRECT_DATA }
SELECT groupNumericIndexedVector(x, y) FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, Null), (3, 2), (0, 0), (5, 1));
SELECT groupNumericIndexedVector(x, y) FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, inf), (3, 2), (0, 0), (5, 1)); -- { serverError INCORRECT_DATA }
SELECT groupNumericIndexedVector(x, y) FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, -inf), (3, 2), (0, 0), (5, 1)); -- { serverError INCORRECT_DATA }
-- https://github.com/ClickHouse/ClickHouse/issues/83591
SELECT 'Test for overflows' AS test;
CREATE TABLE test (t AggregateFunction(groupNumericIndexedVectorState, UInt32, Float64)) ENGINE = AggregatingMergeTree ORDER BY tuple();
CREATE TABLE test2 (t AggregateFunction(groupNumericIndexedVectorState, UInt32, UInt64)) ENGINE = AggregatingMergeTree ORDER BY tuple();
INSERT INTO test SELECT groupNumericIndexedVectorState(toUInt32(1), 1.54743e+26); -- { serverError INCORRECT_DATA }
INSERT INTO test SELECT groupNumericIndexedVectorState(toUInt32(2), -1.54743e+26); -- { serverError INCORRECT_DATA }
INSERT INTO test2 SELECT groupNumericIndexedVectorState(toUInt32(1), 18446744073709551615); -- { serverError INCORRECT_DATA }
