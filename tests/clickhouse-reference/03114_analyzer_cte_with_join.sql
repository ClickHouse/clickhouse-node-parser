-- Tags: no-replicated-database
-- https://github.com/ClickHouse/ClickHouse/issues/58500

SET enable_analyzer=1;
create table t  (ID UInt8) Engine= Memory() ;
insert into t values(1),(2),(3);
