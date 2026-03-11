SELECT data
FROM file(concat(currentDatabase(), '_03762_tuple.parquet'), auto, 'data JSON');

SELECT data
FROM file(concat(currentDatabase(), '_03762_map.parquet'), auto, 'data JSON');