select * from `table_00609` prewhere val > 2 format Null;
select * from `table_00609` prewhere val > 2 format Null SETTINGS max_block_size=100;
select * from `table_00609` prewhere val > 2 format Null SETTINGS max_block_size=1000;
select * from `table_00609` prewhere val > 2 format Null SETTINGS max_block_size=10000;
select * from `table_00609` prewhere val > 2 format Null SETTINGS max_block_size=20000;
select * from `table_00609` prewhere val > 2 format Null SETTINGS max_block_size=30000;
select * from `table_00609` prewhere val > 2 format Null SETTINGS max_block_size=40000;
select * from `table_00609` prewhere val > 2 format Null SETTINGS max_block_size=80000;
