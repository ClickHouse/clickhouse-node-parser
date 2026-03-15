SET optimize_on_insert = 0;
CREATE TABLE tags (
    id String,
    seqs Array(UInt8),
    create_time DateTime DEFAULT now()
) engine=ReplacingMergeTree()
ORDER BY (id);
create table TestTable (column String, start DateTime, end DateTime) engine MergeTree order by start;
SELECT column,
(SELECT d from (select [1, 2, 3, 4] as d)) as d
FROM TestTable
where column == 'test'
GROUP BY column;
CREATE TABLE aaa (
    id UInt16,
    data String
)
ENGINE = MergeTree()
PARTITION BY tuple()
ORDER BY id;
CREATE TABLE bbb (
    id UInt16,
    data String
)
ENGINE = MergeTree()
PARTITION BY tuple()
ORDER BY id;
