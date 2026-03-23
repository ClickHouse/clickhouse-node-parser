SET optimize_on_insert = 0;

SYSTEM DROP  TABLE IF EXISTS tags;

CREATE TABLE tags
(
    id String,
    seqs Array(UInt8),
    create_time DateTime DEFAULT now()
)
ENGINE = ReplacingMergeTree()
ORDER BY (id);

INSERT INTO tags (id, seqs);

SYSTEM DROP  TABLE tags;

-- https://github.com/ClickHouse/ClickHouse/issues/15294
SYSTEM drop  table if exists TestTable;

CREATE TABLE TestTable
(
    column String,
    start DateTime,
    `end` DateTime
)
ENGINE = MergeTree
ORDER BY start;

INSERT INTO TestTable (column, start, `end`);

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

SYSTEM drop  table TestTable;

-- https://github.com/ClickHouse/ClickHouse/issues/11407
SYSTEM drop  table if exists aaa;

SYSTEM drop  table if exists bbb;

CREATE TABLE aaa
(
    id UInt16,
    data String
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY tuple();

INSERT INTO aaa;

CREATE TABLE bbb
(
    id UInt16,
    data String
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY tuple();

INSERT INTO bbb;

SYSTEM drop  table aaa;

SYSTEM drop  table bbb;