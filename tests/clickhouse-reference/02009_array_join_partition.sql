CREATE TABLE table_2009_part (`i` Int64, `d` Date, `s` String) ENGINE = MergeTree PARTITION BY toYYYYMM(d) ORDER BY i;
