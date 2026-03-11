select data from file(currentDatabase() || '_03762_tuple.parquet', auto, 'data JSON');
select data from file(currentDatabase() || '_03762_map.parquet', auto, 'data JSON');
