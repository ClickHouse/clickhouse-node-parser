SELECT *
FROM file(concat(currentDatabase(), '_03755_output/date=2019-04-04/path.snappy.parquet'))
ORDER BY foo_key ASC;