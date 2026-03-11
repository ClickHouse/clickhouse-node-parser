select * from t1 ORDER BY ALL;
select * from t2 ORDER BY ALL;
SELECT * FROM (select rowNumberInAllBlocks() + 1 as id, t1.id, t2.id from t1 left join t2 on t1.id=t2.id) ORDER BY ALL;
SELECT * FROM (select rowNumberInAllBlocks() + 1 as id, t1.id, t2.id, t1.name, t2.name from t1 left join t2 on t1.id=t2.id) ORDER BY ALL;
SELECT * FROM t3 ORDER BY ALL;
