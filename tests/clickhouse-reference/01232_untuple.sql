select untuple((* except (b),)) from (select 1 a, 2 b, 3 c);
select 'hello', untuple((* except (b),)), 'world' from (select 1 a, 2 b, 3 c);
select argMax(untuple(x)) from (select (number, number + 1) as x from numbers(10));
select argMax(untuple(x)), min(x) from (select (number, number + 1) as x from numbers(10)) having tuple(untuple(min(x))).1 != 42;
select key, untuple(argMax((* except (key),), v1)) from kv group by key order by key format TSVWithNames;
