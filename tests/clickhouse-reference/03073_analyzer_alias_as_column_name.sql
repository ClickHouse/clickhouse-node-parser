-- https://github.com/ClickHouse/ClickHouse/issues/27068
SET enable_analyzer=1;
CREATE TABLE test ( id String, create_time DateTime ) ENGINE = MergeTree ORDER BY id;
select id,'1997-02-01' as create_time from test where test.create_time='1970-02-01 00:00:00' ORDER BY id
