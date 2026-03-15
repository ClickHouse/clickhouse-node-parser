SET optimize_on_insert = 0;

CREATE TABLE tags
(
    id String,
    seqs Array(UInt8),
    create_time DateTime DEFAULT now()
)
ENGINE = ReplacingMergeTree()
ORDER BY (id);

CREATE TABLE TestTable
(
    column String,
    start DateTime,
    `end` DateTime
)
ENGINE = MergeTree
ORDER BY start;

SELECT
    column,
    (
        SELECT d
        FROM (
                SELECT [1, 2, 3, 4] AS d
            )
    ) AS d
FROM TestTable
WHERE column == 'test'
GROUP BY column;

CREATE TABLE aaa
(
    id UInt16,
    data String
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY tuple();

CREATE TABLE bbb
(
    id UInt16,
    data String
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY tuple();