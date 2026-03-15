SET session_timezone='UTC';
-- toDate32 function
CREATE TABLE test_date32_casts (from String, val Date32) Engine=Memory;
SELECT from, val, val::Int32 FROM test_date32_casts ORDER BY ALL;
-- toDate function
CREATE TABLE test_date_casts (from String, val Date) Engine=Memory;
SELECT from, val, val::UInt16 FROM test_date_casts ORDER BY ALL;
CREATE TABLE fuzz_71531 (c0 Date32 DEFAULT -30000) ENGINE = Memory();
SELECT c0 FROM fuzz_71531 ORDER BY c0 ASC;
CREATE TABLE fuzz_86799 (c0 Date32) ENGINE = Memory;
SELECT c0 FROM fuzz_86799 ORDER BY c0;
