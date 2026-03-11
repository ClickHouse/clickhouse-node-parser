SELECT count() FROM
(
    EXPLAIN PIPELINE SELECT * FROM t_read_in_order_1 ORDER BY id
) WHERE explain LIKE '%BufferChunks%';
SELECT count() FROM
(
    EXPLAIN PIPELINE SELECT * FROM t_read_in_order_1 ORDER BY id LIMIT 10
) WHERE explain LIKE '%BufferChunks%';
SELECT count() FROM
(
    EXPLAIN PIPELINE SELECT * FROM t_read_in_order_1 WHERE v % 10 = 0 ORDER BY id LIMIT 10
) WHERE explain LIKE '%BufferChunks%';
