CREATE TABLE e
(
    dt DateTime,
    t Int32
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (t, toYYYYMM(dt));

SELECT COUNT(*)
FROM e
WHERE (t, dt) IN (86, '2022-12-12 11:00:00');