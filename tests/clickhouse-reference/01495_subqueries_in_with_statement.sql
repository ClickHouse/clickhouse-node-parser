DROP TABLE IF EXISTS test1;
CREATE TABLE test1(i int, j int) ENGINE Log;
INSERT INTO test1 VALUES (1, 2), (3, 4);
SELECT * FROM (WITH test1 AS (SELECT toInt32(*) i FROM numbers(5)) SELECT * FROM test1) l ANY INNER JOIN test1 r on (l.i == r.i);
select '---------------------------';
set empty_result_for_aggregation_by_empty_set = 0;
drop table if exists with_test ;
create table with_test engine=Memory as select cast(number-1 as Nullable(Int64))  n from numbers(10000);
drop table  with_test ;
