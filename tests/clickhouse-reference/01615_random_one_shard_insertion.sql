select count() != 0 from shard_0.tbl;
select count() != 0 from shard_1.tbl;
select * from distr order by number LIMIT 20;
