SELECT
    _shard_num,
    *
FROM test_dist
ORDER BY
    id ASC,
    _shard_num ASC;

SELECT count()
FROM test_dist AS a
WHERE id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 1
        SETTINGS distributed_product_mode = 'allow'
    )
SETTINGS enable_analyzer = 1;

SELECT count()
FROM test_dist AS a
WHERE id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 1
        SETTINGS distributed_product_mode = 'local'
    )
SETTINGS enable_analyzer = 1;

SELECT count()
FROM test_dist AS a
WHERE id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 1
        SETTINGS distributed_product_mode = 'local'
    )
    AND id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 2
        SETTINGS distributed_product_mode = 'local'
    )
SETTINGS enable_analyzer = 1;

SELECT count()
FROM test_dist AS a
WHERE id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 1
        SETTINGS distributed_product_mode = 'local'
    )
    AND id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 2
        SETTINGS distributed_product_mode = 'allow'
    )
SETTINGS enable_analyzer = 1;

SELECT count()
FROM test_dist AS a
WHERE id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 1
        SETTINGS distributed_product_mode = 'allow'
    )
    AND id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 2
        SETTINGS distributed_product_mode = 'local'
    )
SETTINGS enable_analyzer = 1;

SELECT count()
FROM test_dist AS a
WHERE id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 1
        SETTINGS distributed_product_mode = 'allow'
    )
    AND id IN (
        SELECT id
        FROM test_dist
        WHERE dtm != 2
        SETTINGS distributed_product_mode = 'allow'
    )
SETTINGS enable_analyzer = 1;