SET optimize_skip_merged_partitions=1;
CREATE TABLE optimize_final(t DateTime, x Int32) ENGINE = MergeTree() PARTITION BY toYYYYMM(t) ORDER BY x;
SELECT table, partition, active, level from system.parts where table = 'optimize_final' and database = currentDatabase() and active = 1;
