CREATE TABLE ms
(
    n Int32
)
ENGINE = MergeTree()
ORDER BY n
SETTINGS min_compress_block_size = 1024, max_compress_block_size = 10240;

SELECT COUNT(*)
FROM ms;