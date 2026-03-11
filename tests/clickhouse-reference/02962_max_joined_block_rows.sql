SELECT max(bs) <= 5, b FROM (
    SELECT blockSize() as bs, * FROM t1 JOIN t2 ON t1.a = t2.a
) GROUP BY b
ORDER BY b
SETTINGS max_joined_block_size_rows = 5;
SELECT '--';
SELECT max(bs) <= 10, b FROM (
    SELECT blockSize() as bs, * FROM t1 JOIN t2 ON t1.a = t2.a
) GROUP BY b
ORDER BY b
SETTINGS max_joined_block_size_rows = 10;
