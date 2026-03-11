SELECT sum(flag)
FROM (
        SELECT dictHas(concat(current_database(), '.cache_hits'), toUInt64(WatchID)) AS flag
        FROM test.hits
        PREWHERE WatchID % 1400 == 0
        LIMIT 100
    );

SELECT count()
FROM test.hits
PREWHERE WatchID % 1400 == 0;

SELECT sum(flag)
FROM (
        SELECT dictHas(concat(current_database(), '.cache_hits'), toUInt64(WatchID)) AS flag
        FROM test.hits
        PREWHERE WatchID % 350 == 0
        LIMIT 100
    );

SELECT count()
FROM test.hits
PREWHERE WatchID % 350 == 0;

SELECT sum(flag)
FROM (
        SELECT dictHas(concat(current_database(), '.cache_hits'), toUInt64(WatchID)) AS flag
        FROM test.hits
        PREWHERE WatchID % 5 == 0
        LIMIT 100
    );

SELECT count()
FROM test.hits
PREWHERE WatchID % 5 == 0;