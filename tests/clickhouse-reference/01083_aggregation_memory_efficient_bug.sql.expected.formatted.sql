SELECT sum(a)
FROM (
        SELECT
            B,
            uniqExact(A) AS a
        FROM remote('localhost,127.0.0.1', currentDatabase(), da_memory_efficient_shard)
        GROUP BY B
    );