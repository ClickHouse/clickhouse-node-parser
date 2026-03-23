CREATE TABLE test_collation
(
    `v` String,
    `v2` String
)
ENGINE = MergeTree
ORDER BY v
SETTINGS index_granularity = 8192;
insert into test_collation values ('A', 'A');
insert into test_collation values ('B', 'B');
insert into test_collation values ('C', 'C');
SELECT * FROM test_collation ORDER BY v ASC COLLATE 'en';
