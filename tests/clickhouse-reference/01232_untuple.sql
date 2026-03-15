SET enable_analyzer = 1;
SET enable_named_columns_in_function_tuple = 1;
select untuple((* except (b),)) from (select 1 a, 2 b, 3 c);
select 'hello', untuple((* except (b),)), 'world' from (select 1 a, 2 b, 3 c);
select argMax(untuple(x)) from (select (number, number + 1) as x from numbers(10));
select argMax(untuple(x)), min(x) from (select (number, number + 1) as x from numbers(10)) having tuple(untuple(min(x))).1 != 42;
create table kv (key int, v1 int, v2 int, v3 int, v4 int, v5 int) engine MergeTree order by key;
select key, untuple(argMax((* except (key),), v1)) from kv group by key order by key format TSVWithNames;
