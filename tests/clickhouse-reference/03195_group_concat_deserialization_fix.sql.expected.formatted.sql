CREATE TABLE test_serialization
(
    id UInt64,
    text AggregateFunction(groupConcat, String)
)
ENGINE = AggregatingMergeTree()
ORDER BY id;

SELECT groupConcatMerge(text) AS concatenated_text
FROM test_serialization
GROUP BY id;

SELECT groupConcatMerge(text) AS concatenated_text
FROM test_serialization
GROUP BY id
ORDER BY id ASC;