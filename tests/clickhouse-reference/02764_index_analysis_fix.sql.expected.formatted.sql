CREATE TABLE x
(
    dt String
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toYYYYMM(toDate(dt));

SELECT *
FROM x
WHERE like(dt, '2022-10-01%');