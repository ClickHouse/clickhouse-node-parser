CREATE TABLE table1
(
    A String,
    B String,
    ts DateTime
)
ENGINE = MergeTree
ORDER BY (ts, A, B)
PARTITION BY toStartOfDay(ts);

CREATE TABLE table2
(
    B String,
    ts DateTime
)
ENGINE = MergeTree
ORDER BY (ts, B)
PARTITION BY toStartOfDay(ts);

SELECT
    t1.B,
    t2.B
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.B = t2.B
ORDER BY
    t1.B ASC,
    t2.B ASC;