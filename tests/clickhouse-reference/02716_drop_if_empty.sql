SELECT count() FROM system.tables WHERE database = {CLICKHOUSE_DATABASE_1:String};
SELECT count() FROM system.tables WHERE database = 'default' AND name IN ('data_02716_1', 'data_02716_2');
