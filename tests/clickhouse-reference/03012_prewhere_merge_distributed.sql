CREATE TABLE test_local ( name String, date Date, sign Int8 ) ENGINE MergeTree PARTITION BY date ORDER BY name SETTINGS index_granularity = 8192;
CREATE TABLE test_distributed ( name String, date Date, sign Int8 ) ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), test_local, rand64());
SET insert_distributed_sync = 1;
SELECT count() FROM test_distributed WHERE name GLOBAL IN ( SELECT name FROM test_distributed );
SET prefer_localhost_replica = 1;
SELECT count() FROM merge(currentDatabase(), '^test_distributed$') WHERE name GLOBAL IN ( SELECT name FROM test_distributed );
SELECT count() FROM merge(currentDatabase(), '^test_distributed$') PREWHERE name GLOBAL IN ( SELECT name FROM test_distributed );
SET prefer_localhost_replica = 0;
CREATE TABLE test_log ( a int, b int ) ENGINE Log;
SELECT count() FROM merge(currentDatabase(), '^test_log$') PREWHERE a = 3; -- { serverError 182 }
