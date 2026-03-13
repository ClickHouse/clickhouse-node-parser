-- Try to read it with 60 MB memory limit. Should fail because we read the 80 MB column all at once.
SELECT sum(ignore(*))
FROM file('03147_parquet_memory_tracking.parquet')
SETTINGS max_memory_usage = 60000000; -- { serverError MEMORY_LIMIT_EXCEEDED }

-- Try to read it with 500 MB memory limit, just in case.
SELECT sum(ignore(*))
FROM file('03147_parquet_memory_tracking.parquet')
SETTINGS max_memory_usage = 500000000;