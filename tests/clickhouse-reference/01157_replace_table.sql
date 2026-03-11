select * from t order by n;
select count() from system.tables where database=currentDatabase() and name='join';
select * from numbers(10) as t any join join on t.number=join.n order by n;
select name from system.tables where database=currentDatabase() order by name;
