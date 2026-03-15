CREATE TABLE sample_merge_tree (dt DateTime, x UInt64) ENGINE = MergeTree PARTITION BY toYYYYMMDD(dt) ORDER BY x SETTINGS min_merge_bytes_to_use_direct_io=1, index_granularity = 8192;
SELECT * FROM sample_merge_tree ORDER BY x;
