-- Tags: stateful, no-parallel
-- no-parallel: Heavy usage
SET check_query_single_value_result = 1;

CREATE TABLE test.hits_log
(
    CounterID UInt32,
    AdvEngineID UInt8,
    RegionID UInt32,
    SearchPhrase String,
    UserID UInt64
)
ENGINE = Log;

CREATE TABLE test.hits_tinylog
(
    CounterID UInt32,
    AdvEngineID UInt8,
    RegionID UInt32,
    SearchPhrase String,
    UserID UInt64
)
ENGINE = TinyLog;

CREATE TABLE test.hits_stripelog
(
    CounterID UInt32,
    AdvEngineID UInt8,
    RegionID UInt32,
    SearchPhrase String,
    UserID UInt64
)
ENGINE = StripeLog;

SELECT
    count(),
    sum(cityHash64(CounterID, AdvEngineID, RegionID, SearchPhrase, UserID))
FROM test.hits;

SELECT
    count(),
    sum(cityHash64(*))
FROM test.hits_log;

SELECT
    count(),
    sum(cityHash64(*))
FROM test.hits_tinylog;

SELECT
    count(),
    sum(cityHash64(*))
FROM test.hits_stripelog;