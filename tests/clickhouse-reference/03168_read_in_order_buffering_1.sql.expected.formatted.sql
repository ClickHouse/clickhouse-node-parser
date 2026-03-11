SELECT count()
FROM (
        EXPLAIN PIPELINE
        SELECT *
        FROM t_read_in_order_1
        ORDER BY id ASC
    )
WHERE like(`explain`, '%BufferChunks%');

SELECT count()
FROM (
        EXPLAIN PIPELINE
        SELECT *
        FROM t_read_in_order_1
        ORDER BY id ASC
        LIMIT 10
    )
WHERE like(`explain`, '%BufferChunks%');

SELECT count()
FROM (
        EXPLAIN PIPELINE
        SELECT *
        FROM t_read_in_order_1
        WHERE v % 10 = 0
        ORDER BY id ASC
        LIMIT 10
    )
WHERE like(`explain`, '%BufferChunks%');