-- https://github.com/ClickHouse/ClickHouse/issues/29748
SET enable_analyzer=1;
create table events ( distinct_id String ) engine = Memory;
