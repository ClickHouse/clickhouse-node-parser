select sleep(1) format Null; -- sleep a bit to wait possible merges after insert
select sum(a) from t where a in (0, 3) and b = 0;
