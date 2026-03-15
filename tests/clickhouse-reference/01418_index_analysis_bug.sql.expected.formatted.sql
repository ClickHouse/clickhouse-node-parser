CREATE TABLE mytable_local
(
    created DateTime,
    eventday Date,
    user_id UInt32
)
ENGINE = MergeTree()
ORDER BY (eventday, user_id)
PARTITION BY toYYYYMM(eventday);

SELECT
    eventday,
    count(*)
FROM mytable_local
WHERE (toYYYYMM(eventday) = 202007)
    AND (user_id = 742522)
    AND (eventday >= '2020-07-03')
    AND (eventday <= '2020-07-25')
GROUP BY eventday
ORDER BY eventday ASC;

CREATE TABLE table_float
(
    f Float64,
    u UInt32
)
ENGINE = MergeTree
ORDER BY (f, u);

SELECT count()
FROM table_float
WHERE (toUInt64(f) = 1)
    AND (f >= 1.3)
    AND (f <= 1.4)
    AND (u > 0);