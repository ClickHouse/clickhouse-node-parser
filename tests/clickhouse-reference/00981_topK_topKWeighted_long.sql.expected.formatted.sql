CREATE TABLE topk
(
    val1 String,
    val2 UInt32
)
ENGINE = MergeTree
ORDER BY val1
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT arraySort(topK(10)(val1))
FROM topk;

SELECT arraySort(topKWeighted(10)(val1, val2))
FROM topk;

SELECT topKWeighted(10)(toString(number), number)
FROM numbers(3000000);