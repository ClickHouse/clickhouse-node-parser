-- { echo }
create table values_01564(
    a int,
    constraint c1 check a < 10) engine Memory;
-- client error hint after broken insert values
insert into values_01564 values ('f'); -- { error CANNOT_PARSE_TEXT }
select 1;
select nonexistent column; -- { serverError UNKNOWN_IDENTIFIER }
-- server error hint after broken insert values (violated constraint)
insert into values_01564 values (11); -- { serverError VIOLATED_CONSTRAINT }
-- query after values on the same line
insert into values_01564 values (1);
-- a failing insert and then a normal insert (#https://github.com/ClickHouse/ClickHouse/issues/19353)
CREATE TABLE t0 (c0 String, c1 Int32) ENGINE = Memory() ;
INSERT INTO t0(c0, c1) VALUES ("1",1) ; -- { error UNKNOWN_IDENTIFIER }
INSERT INTO t0(c0, c1) VALUES ('1', 1) ;
