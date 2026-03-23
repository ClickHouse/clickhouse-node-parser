SET log_queries = 1;
CREATE TABLE xp (`A` Date, `B` Int64, `S` String) ENGINE = MergeTree PARTITION BY toYYYYMM(A) ORDER BY B;
INSERT INTO xp SELECT '2020-01-01', number, '' FROM numbers(100000);
CREATE TABLE xp_d AS xp ENGINE = Distributed(test_shard_localhost, currentDatabase(), xp);
SELECT count(7 = (SELECT number FROM numbers(0) ORDER BY number ASC NULLS FIRST LIMIT 7)) FROM xp_d PREWHERE toYYYYMM(A) GLOBAL IN (SELECT NULL = (SELECT number FROM numbers(1) ORDER BY number DESC NULLS LAST LIMIT 1), toYYYYMM(min(A)) FROM xp_d) WHERE B > NULL FORMAT Null;
SELECT count() FROM xp_d WHERE A GLOBAL IN (SELECT NULL);
CREATE TABLE trace_log
(
   `event_date` Date,
   `event_time` DateTime,
   `event_time_microseconds` DateTime64(6),
   `timestamp_ns` UInt64,
   `revision` UInt32,
   `trace_type` Enum8('Real' = 0, 'CPU' = 1, 'Memory' = 2, 'MemorySample' = 3),
   `thread_id` UInt64,
   `query_id` String,
   `trace` Array(UInt64),
   `size` Int64
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_date, event_time)
SETTINGS index_granularity = 8192;
INSERT INTO trace_log values ('2020-10-06','2020-10-06 13:43:39','2020-10-06 13:43:39.208819',1601981019208819975,54441,'Real',20412,'2e8ddf40-48da-4641-8ccc-573dd487753f',[140316350688023,130685338,226362737,224904385,227758790,227742969,227761037,224450136,219847931,219844987,219854151,223212098,223208665,228194329,228227607,257889111,257890159,258775545,258767526,140316350645979,140316343425599],0);
set allow_introspection_functions = 1;
set joined_subquery_requires_alias=0, enable_analyzer=0; -- the query is invalid with a new analyzer
SELECT number, number / 2 AS n, j1, j2 FROM remote('127.0.0.{2,3}', system.numbers) GLOBAL ANY LEFT JOIN (SELECT number / 3 AS n, number AS j1, 'Hello' AS j2 FROM system.numbers LIMIT 1048577) USING (n) LIMIT 10 format Null;
