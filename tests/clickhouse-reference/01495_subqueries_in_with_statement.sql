CREATE TABLE test1(i int, j int) ENGINE Log;
SELECT * FROM (WITH test1 AS (SELECT toInt32(*) i FROM numbers(5)) SELECT * FROM test1) l ANY INNER JOIN test1 r on (l.i == r.i);
select '---------------------------';
set empty_result_for_aggregation_by_empty_set = 0;
create table with_test engine=Memory as select cast(number-1 as Nullable(Int64))  n from numbers(10000);
