CREATE TABLE t_03203 (p UInt64, v UInt64) ENGINE = MergeTree PARTITION BY p ORDER BY v;
SELECT * FROM t_03203 ORDER BY p, v;
SELECT count() FROM system.detached_parts WHERE database = currentDatabase() AND table = 't_03203';
