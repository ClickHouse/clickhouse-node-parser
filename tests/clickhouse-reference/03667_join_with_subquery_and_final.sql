set enable_analyzer=0;
CREATE TABLE 03667_t1 ( `key` Int64, `value` Int64 ) ENGINE = ReplacingMergeTree PARTITION BY tuple() ORDER BY key SETTINGS index_granularity = 8192;
CREATE TABLE 03667_t2 ( `key` Int64, `value` Int64 ) ENGINE = ReplacingMergeTree PARTITION BY tuple() ORDER BY key SETTINGS index_granularity = 8192;
CREATE TABLE 03667_t3 ( `key` Int64, `value` Int64 ) ENGINE = ReplacingMergeTree PARTITION BY tuple() ORDER BY key SETTINGS index_granularity = 8192;
