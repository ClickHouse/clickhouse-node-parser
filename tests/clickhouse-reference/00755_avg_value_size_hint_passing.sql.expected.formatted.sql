CREATE TABLE size_hint
(
    s Array(String)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1000, index_granularity_bytes = '10Mi';

SET max_block_size = 1000;

SET max_memory_usage = 1000000000;

SET max_memory_usage = 105000000, max_threads = 2;

SELECT
    count(),
    sum(length(s))
FROM size_hint;