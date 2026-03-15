select * from (SELECT number as a FROM numbers(10)) t1 PASTE JOIN (select number as a from numbers(10)) t2;
select * from (SELECT number as a FROM numbers(10)) t1 PASTE JOIN (select number as a from numbers(10) order by a desc) t2;
create table if not exists test (number UInt64) engine=Memory;
SELECT * FROM (SELECT 1) t1 PASTE JOIN (SELECT 2) SETTINGS joined_subquery_requires_alias=0;
select * from (SELECT number as a FROM numbers(11)) t1 PASTE JOIN test t2 SETTINGS max_threads=1;
select * from (SELECT number as a FROM numbers(11)) t1 PASTE JOIN (select * from test limit 2) t2 SETTINGs max_threads=1;
CREATE TABLE t1 (a UInt64, b UInt64) ENGINE = Memory;
CREATE TABLE t2 (a UInt64, b UInt64) ENGINE = Memory;
SELECT * FROM ( SELECT * from t1 ) t1 PASTE JOIN ( SELECT * from t2 ) t2 SETTINGS max_threads = 1;
SELECT toTypeName(a) FROM (SELECT number as a FROM numbers(11)) t1 PASTE JOIN (select number as a from numbers(10)) t2 SETTINGS join_use_nulls = 1;
SET max_threads = 2;
select * from (SELECT number as a FROM numbers_mt(10)) t1 PASTE JOIN (select number as a from numbers(10) ORDER BY a DESC) t2 SETTINGS max_block_size=10;
SELECT * FROM (SELECT number FROM test) PASTE JOIN (SELECT number FROM numbers(6) ORDER BY number) SETTINGS joined_subquery_requires_alias = 0;
SELECT * FROM (SELECT number FROM test PASTE JOIN (Select number FROM numbers(7))) PASTE JOIN (SELECT number FROM numbers(6) PASTE JOIN (SELECT number FROM test)) SETTINGS joined_subquery_requires_alias = 0;
SELECT * FROM (SELECT number FROM test PASTE JOIN (SELECT number FROM test PASTE JOIN (Select number FROM numbers(7)))) PASTE JOIN (SELECT number FROM numbers(6) PASTE JOIN (SELECT number FROM test)) SETTINGS joined_subquery_requires_alias = 0;
SELECT * FROM (SELECT 1 AS a) PASTE JOIN (SELECT 2 AS b) PASTE JOIN (SELECT 3 AS c) SETTINGS enable_analyzer = 1;
SELECT * FROM (SELECT 1 AS a) PASTE JOIN (SELECT 2 AS b) PASTE JOIN (SELECT 3 AS a) SETTINGS enable_analyzer = 1; -- { serverError AMBIGUOUS_COLUMN_NAME }
SET enable_analyzer = 1;
CREATE TABLE test1 (a Int32) engine=MergeTree order by a;
CREATE TABLE test2 (a Int32) engine=MergeTree order by a;
SELECT * FROM test1 PASTE JOIN (SELECT * FROM test2);
SELECT a `test2.a` FROM test1 PASTE JOIN test2;
SELECT * FROM test1 `test2.a` PASTE JOIN test2 `test2.a`; -- { serverError MULTIPLE_EXPRESSIONS_FOR_ALIAS }
SELECT * FROM test1 PASTE JOIN (SELECT number AS a FROM numbers(2) ORDER BY number DESC); -- { serverError AMBIGUOUS_COLUMN_NAME }
