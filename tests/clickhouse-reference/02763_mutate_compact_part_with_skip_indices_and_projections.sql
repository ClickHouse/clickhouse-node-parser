CREATE TABLE test ( col1 Int64, dt Date ) ENGINE = MergeTree PARTITION BY dt ORDER BY tuple();
