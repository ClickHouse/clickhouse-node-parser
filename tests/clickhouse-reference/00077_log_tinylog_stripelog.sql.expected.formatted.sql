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