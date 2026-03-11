-- without this limit (i.e. max_joined_block_size_rows=0) consumption is ~8-10G

select * from t t1 join t t2 on t1.n = t2.n format Null settings max_joined_block_size_rows = 65409;
