SET optimize_on_insert = 0;
CREATE TABLE tags (
    id String,
    seqs Array(UInt8),
    create_time DateTime DEFAULT now()
) engine=ReplacingMergeTree()
ORDER BY (id);
INSERT INTO tags(id, seqs) VALUES ('id1', [1,2,3]), ('id2', [0,2,3]), ('id1', [1,3]);
create table TestTable (column String, start DateTime, end DateTime) engine MergeTree order by start;
insert into TestTable (column, start, end) values('test', toDateTime('2020-07-20 09:00:00'), toDateTime('2020-07-20 20:00:00')),('test1', toDateTime('2020-07-20 09:00:00'), toDateTime('2020-07-20 20:00:00')),('test2', toDateTime('2020-07-20 09:00:00'), toDateTime('2020-07-20 20:00:00'));
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
INSERT INTO aaa VALUES (1, 'sef'),(2, 'fre'),(3, 'jhg');
CREATE TABLE bbb (
    id UInt16,
    data String
)
ENGINE = MergeTree()
PARTITION BY tuple()
ORDER BY id;
INSERT INTO bbb VALUES (2, 'fre'), (3, 'jhg');
