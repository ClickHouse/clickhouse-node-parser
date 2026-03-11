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