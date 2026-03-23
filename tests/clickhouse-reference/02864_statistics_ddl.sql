-- Tags: no-fasttest, long
-- no-fasttest: 'countmin' sketches need a 3rd party library

-- Tests that DDL statements which create / drop / materialize statistics

SET mutations_sync = 1;
DROP TABLE IF EXISTS tab;
SET allow_experimental_statistics = 0;
-- Error case: Can't create statistics when allow_experimental_statistics = 0
CREATE TABLE tab (col Float64 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError INCORRECT_QUERY }
SET allow_experimental_statistics = 1;
-- Error case: Unknown statistics types are rejected
CREATE TABLE tab (col Float64 STATISTICS(no_statistics_type)) Engine = MergeTree() ORDER BY tuple(); -- { serverError INCORRECT_QUERY }
-- Error case: The same statistics type can't exist more than once on a column
CREATE TABLE tab (col Float64 STATISTICS(tdigest, tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError INCORRECT_QUERY }
SET allow_suspicious_low_cardinality_types = 1;
-- Statistics can only be created on columns of specific data types (depending on the statistics kind), (*)

--   tdigest requires data_type.isValueRepresentedByInteger
--     These types work:
CREATE TABLE tab (col UInt8 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
DROP TABLE tab;
CREATE TABLE tab (col UInt256 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Float32 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Decimal32(3) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date32 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime64 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Enum('hello', 'world') STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Nullable(UInt8) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(UInt8) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(Nullable(UInt8)) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple();
--     These types don't work:
CREATE TABLE tab (col String STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col FixedString(1) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Array(Float64) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Tuple(Float64, Float64) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Map(UInt64, UInt64) STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col UUID STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col IPv4 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col IPv6 STATISTICS(tdigest)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
--   uniq requires data_type.isValueRepresentedByInteger or (Fixed)String
--     These types work:
CREATE TABLE tab (col UInt8 STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col UInt256 STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Float32 STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Decimal32(3) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date32 STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime64 STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Enum('hello', 'world') STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col IPv4 STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Nullable(UInt8) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(UInt8) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(Nullable(UInt8)) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col String STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col FixedString(1) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple();
--     These types don't work:
CREATE TABLE tab (col Array(Float64) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Tuple(Float64, Float64) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Map(UInt64, UInt64) STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col UUID STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col IPv6 STATISTICS(uniq)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
--   countmin requires data_type.isValueRepresentedByInteger or data_type = (Fixed)String
--     These types work:
CREATE TABLE tab (col UInt8 STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col UInt256 STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Float32 STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Decimal32(3) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date32 STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime64 STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Enum('hello', 'world') STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col IPv4 STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Nullable(UInt8) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(UInt8) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(Nullable(UInt8)) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col String STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col FixedString(1) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple();
--     These types don't work:
CREATE TABLE tab (col Array(Float64) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Tuple(Float64, Float64) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Map(UInt64, UInt64) STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col UUID STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col IPv6 STATISTICS(countmin)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
--   minmax requires data_type.isValueRepresentedByInteger
--     These types work:
CREATE TABLE tab (col UInt8 STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col UInt256 STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Float32 STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Decimal32(3) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Date32 STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col DateTime64 STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Enum('hello', 'world') STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col IPv4 STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col Nullable(UInt8) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(UInt8) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
CREATE TABLE tab (col LowCardinality(Nullable(UInt8)) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple();
--     These types don't work:
CREATE TABLE tab (col String STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col FixedString(1) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Array(Float64) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Tuple(Float64, Float64) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col Map(UInt64, UInt64) STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col UUID STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
CREATE TABLE tab (col IPv6 STATISTICS(minmax)) Engine = MergeTree() ORDER BY tuple(); -- { serverError ILLEGAL_STATISTICS }
-- CREATE TABLE was easy, ALTER is more fun

CREATE TABLE tab
(
    f64           Float64,
    f64_tdigest   Float64 STATISTICS(tdigest),
    f32           Float32,
    s             String,
    a             Array(Float64)
)
Engine = MergeTree()
ORDER BY tuple();
