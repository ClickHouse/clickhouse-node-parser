-- { echo }
create table values_01564(
    a int,
    constraint c1 check a < 10) engine Memory;
select 1;
select nonexistent column; -- { serverError UNKNOWN_IDENTIFIER }
-- a failing insert and then a normal insert (#https://github.com/ClickHouse/ClickHouse/issues/19353)
CREATE TABLE t0 (c0 String, c1 Int32) ENGINE = Memory() ;
