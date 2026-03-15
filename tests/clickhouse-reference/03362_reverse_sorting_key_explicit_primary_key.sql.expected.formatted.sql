CREATE TABLE x1
(
    i Nullable(int)
)
ENGINE = MergeTree
ORDER BY i DESC
PRIMARY KEY i
SETTINGS allow_nullable_key = 1, index_granularity = 2, allow_experimental_reverse_key = 1;

SELECT *
FROM x1
WHERE i = 3;

SELECT count()
FROM x1
WHERE and(greaterOrEquals(i, 3), lessOrEquals(i, 10));