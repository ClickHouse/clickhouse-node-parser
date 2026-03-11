

select _shard_num, * from test_dist order by id, _shard_num;
select count() from test_dist a where id in (select id from test_dist where dtm != 1 settings distributed_product_mode='allow') settings enable_analyzer=1;
select count() from test_dist a where id in (select id from test_dist where dtm != 1 settings distributed_product_mode='local') settings enable_analyzer=1;
select count() from test_dist a where id in (select id from test_dist where dtm != 1 settings distributed_product_mode='local') and id in (select id from test_dist where dtm != 2 settings distributed_product_mode='local') settings enable_analyzer=1;
select count() from test_dist a where id in (select id from test_dist where dtm != 1 settings distributed_product_mode='local') and id in (select id from test_dist where dtm != 2 settings distributed_product_mode='allow') settings enable_analyzer=1;
select count() from test_dist a where id in (select id from test_dist where dtm != 1 settings distributed_product_mode='allow') and id in (select id from test_dist where dtm != 2 settings distributed_product_mode='local') settings enable_analyzer=1;
select count() from test_dist a where id in (select id from test_dist where dtm != 1 settings distributed_product_mode='allow') and id in (select id from test_dist where dtm != 2 settings distributed_product_mode='allow') settings enable_analyzer=1;
