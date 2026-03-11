select * from (select sum(number) from num_10m union all select sum(number) from num_10m) limit 1 settings max_block_size = 1024;
