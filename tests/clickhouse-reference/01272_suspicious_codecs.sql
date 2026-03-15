CREATE TABLE codecs
(
    a UInt8 CODEC(LZ4),
    b UInt16 CODEC(ZSTD),
    c Float32 CODEC(Gorilla),
    d UInt8 CODEC(Delta, LZ4),
    e Float64 CODEC(Gorilla, ZSTD),
    f UInt32 CODEC(Delta, Delta, T64),
    g DateTime CODEC(DoubleDelta),
    h DateTime64 CODEC(DoubleDelta, LZ4),
    i String CODEC(NONE)
) ENGINE = MergeTree ORDER BY tuple();
-- test what should not work

CREATE TABLE codecs (a UInt8 CODEC(NONE, NONE)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(NONE, LZ4)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(LZ4, NONE)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(LZ4, LZ4)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(LZ4, ZSTD)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(Delta)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(Delta, Delta)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(LZ4, Delta)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a UInt8 CODEC(Gorilla)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a FixedString(2) CODEC(Gorilla)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a Decimal(15,5) CODEC(Gorilla)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a Float64 CODEC(Delta, Gorilla)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE codecs (a Float32 CODEC(DoubleDelta, FPC)) ENGINE = MergeTree ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
SET allow_suspicious_codecs = 1;
CREATE TABLE codecs1 (a UInt8 CODEC(NONE, NONE)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs2 (a UInt8 CODEC(NONE, LZ4)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs3 (a UInt8 CODEC(LZ4, NONE)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs4 (a UInt8 CODEC(LZ4, LZ4)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs5 (a UInt8 CODEC(LZ4, ZSTD)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs6 (a UInt8 CODEC(Delta)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs7 (a UInt8 CODEC(Delta, Delta)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs8 (a UInt8 CODEC(LZ4, Delta)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs9 (a UInt8 CODEC(Gorilla)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs10 (a FixedString(2) CODEC(Gorilla)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE codecs11 (a Decimal(15,5) CODEC(Gorilla)) ENGINE = MergeTree ORDER BY tuple();
SET allow_suspicious_codecs = 0;
SELECT * FROM codecs1;
SELECT * FROM codecs2;
SELECT * FROM codecs3;
SELECT * FROM codecs4;
SELECT * FROM codecs5;
SELECT * FROM codecs6;
SELECT * FROM codecs7;
SELECT * FROM codecs8;
SELECT * FROM codecs9;
SELECT * FROM codecs10;
SELECT * FROM codecs11;
