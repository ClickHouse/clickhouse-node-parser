CREATE TABLE t_remove_sample_by(id UInt64) ENGINE = MergeTree ORDER BY id SAMPLE BY id;
SELECT * FROM t_remove_sample_by SAMPLE 1 / 10; -- { serverError SAMPLING_NOT_SUPPORTED }
CREATE TABLE t_remove_sample_by(id UInt64)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/t_remove_sample_by', '1')
ORDER BY id SAMPLE BY id;
CREATE TABLE t_remove_sample_by(id UInt64) ENGINE = Memory;
CREATE TABLE t_remove_sample_by(id String)
ENGINE = MergeTree ORDER BY id SAMPLE BY id
SETTINGS check_sample_column_is_correct = 0;
