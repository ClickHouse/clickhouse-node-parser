SELECT sum(flag) FROM (SELECT dictHas(current_database() || '.cache_hits', toUInt64(WatchID)) as flag FROM test.hits PREWHERE WatchID % 1400 == 0 LIMIT 100);
SELECT count() from test.hits PREWHERE WatchID % 1400 == 0;
SELECT sum(flag) FROM (SELECT dictHas(current_database() || '.cache_hits', toUInt64(WatchID)) as flag FROM test.hits PREWHERE WatchID % 350 == 0 LIMIT 100);
SELECT count() from test.hits PREWHERE WatchID % 350 == 0;
SELECT sum(flag) FROM (SELECT dictHas(current_database() || '.cache_hits', toUInt64(WatchID)) as flag FROM test.hits PREWHERE WatchID % 5 == 0 LIMIT 100);
SELECT count() from test.hits PREWHERE WatchID % 5 == 0;
