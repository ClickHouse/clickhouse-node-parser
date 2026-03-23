-- https://github.com/ClickHouse/ClickHouse/issues/29748
SET enable_analyzer=1;
create table events ( distinct_id String ) engine = Memory;
INSERT INTO events VALUES ('1234'), ('1');
