SELECT * FROM 02526_keeper_map WHERE key in (SELECT number * 5 FROM numbers(1000)) FORMAT Null;
SELECT * FROM 02526_rocksdb WHERE key in (SELECT number * 5 FROM numbers(1000)) FORMAT Null;
