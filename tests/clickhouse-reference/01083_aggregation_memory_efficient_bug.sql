select sum(a) from (SELECT B, uniqExact(A) a FROM remote('localhost,127.0.0.1', currentDatabase(), da_memory_efficient_shard) GROUP BY B);
