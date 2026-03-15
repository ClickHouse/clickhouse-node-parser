CREATE TABLE test.hits_1m AS test.hits
ENGINE = MergeTree
ORDER BY (CounterID, EventDate, intHash32(UserID))
PARTITION BY toYYYYMM(EventDate)
SAMPLE BY intHash32(UserID)
SETTINGS storage_policy = 'default', index_granularity = 8192, index_granularity_bytes = 10485760;

SET max_execution_time = 300;

CREATE DATABASE IF NOT EXISTS db_dict;

CREATE DICTIONARY db_dict.cache_hits
(
    WatchID UInt64,
    UserID UInt64,
    SearchPhrase String
)
PRIMARY KEY WatchID
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'hits_1m' PASSWORD '' DB 'test'))
LIFETIME(MIN 1 MAX 10)
LAYOUT(CACHE(SIZE_IN_CELLS 1 QUERY_WAIT_TIMEOUT_MILLISECONDS 60000));

SELECT count()
FROM (
        SELECT
            WatchID,
            arrayDistinct(groupArray(dictGetUInt64('db_dict.cache_hits', 'UserID', toUInt64(WatchID)))) AS arr
        FROM test.hits_1m
        PREWHERE WatchID % 5 == 0
        GROUP BY WatchID
        ORDER BY length(arr) DESC
    )
WHERE arr = [0];

SELECT count()
FROM (
        SELECT
            WatchID,
            arrayDistinct(groupArray(dictGetUInt64('db_dict.cache_hits', 'UserID', toUInt64(WatchID)))) AS arr
        FROM test.hits_1m
        PREWHERE WatchID % 7 == 0
        GROUP BY WatchID
        ORDER BY length(arr) DESC
    )
WHERE arr = [0];

SELECT count()
FROM (
        SELECT
            WatchID,
            arrayDistinct(groupArray(dictGetUInt64('db_dict.cache_hits', 'UserID', toUInt64(WatchID)))) AS arr
        FROM test.hits_1m
        PREWHERE WatchID % 13 == 0
        GROUP BY WatchID
        ORDER BY length(arr) DESC
    )
WHERE arr = [0];