SET compile_expressions = 1;
SET min_count_to_compile_expression = 0;
CREATE TABLE test_table_1 (id UInt32) ENGINE = MergeTree ORDER BY (id);
create table test_table_2 (id UInt32) ENGINE = MergeTree ORDER BY (id);
select t1.id, t2.id FROM test_table_1 AS t1 RIGHT JOIN test_table_2 AS t2 ON (t1.id = t2.id)
WHERE (acos(t2.id) <> atan(t1.id)) and (not (acos(t2.id) <> atan(t1.id)));
SELECT '--';
SELECT (acos(a) <> atan(b)) and (not (acos(a) <> atan(b))) r FROM (SELECT 2 a, 2 b);
