CREATE TABLE test1
(
    i Int64
)
ENGINE = MergeTree
ORDER BY i;

SELECT count()
FROM test1
WHERE toInt16(i) = 1777;