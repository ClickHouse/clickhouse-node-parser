CREATE TABLE dt_overflow
(
    d Date,
    i int
)
ENGINE = MergeTree
ORDER BY i
PARTITION BY d;

SELECT *
FROM dt_overflow
ORDER BY d ASC;