CREATE TABLE order
(
    ID Int64,
    Type Int64,
    Num UInt64,
    t DateTime
)
ENGINE = MergeTree()
PARTITION BY toYYYYMMDD(t)
ORDER BY (ID, Type, Num);
SELECT Num
FROM order
WHERE Type = 1 AND ID = 1
ORDER BY Num ASC limit 5;
SELECT Num
FROM order
PREWHERE Type = 1
WHERE ID = 1
ORDER BY Num ASC limit 5;
