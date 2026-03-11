SELECT sum(ignore(*))
FROM file('03147_parquet_memory_tracking.parquet')
SETTINGS max_memory_usage = 60000000;

SELECT sum(ignore(*))
FROM file('03147_parquet_memory_tracking.parquet')
SETTINGS max_memory_usage = 500000000;