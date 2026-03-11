select t1.a, t2.b, t3.c from table1 as t1 join table2 as t2 on t1.a = t2.a join table3 as t3 on t2.b = t3.b ORDER BY t1.a;
select t1.a, t2.b, t5.c from table1 as t1 join table2 as t2 on t1.a = t2.a join table5 as t5 on t1.a = t5.a AND t2.b = t5.b ORDER BY t1.a;
select t1.a, t2.a, t2.b, t3.b, t3.c, t5.a, t5.b, t5.c
from table1 as t1
join table2 as t2 on t1.a = t2.a
join table3 as t3 on t2.b = t3.b
join table5 as t5 on t3.c = t5.c
ORDER BY t1.a
FORMAT PrettyCompactNoEscapes;
select t1.a as t1_a, t2.a as t2_a, t2.b as t2_b, t3.b as t3_b
from table1 as t1
join table2 as t2 on t1_a = t2_a
join table3 as t3 on t2_b = t3_b
ORDER BY t1.a
;
select t1.a as t1_a, t2.a as t2_a, t2.b as t2_b, t3.b as t3_b
from table1 as t1
join table2 as t2 on t1.a = t2.a
join table3 as t3 on t2.b = t3.b
ORDER BY t1.a
;
select t1.a as t1_a, t2.a as t2_a, t2.b as t2_b, t3.b as t3_b
from table1 as t1
join table2 as t2 on table1.a = table2.a
join table3 as t3 on table2.b = table3.b
ORDER BY t1.a
;
select t1.a, t2.a, t2.b, t3.b
from table1 as t1
join table2 as t2 on table1.a = table2.a
join table3 as t3 on table2.b = table3.b
ORDER BY t1.a
;
select t1.a, t2.a, t2.b, t3.b
from table1 as t1
join table2 as t2 on t1.a = t2.a
join table3 as t3 on t2.b = t3.b
ORDER BY t1.a
;
select table1.a, table2.a, table2.b, table3.b
from table1 as t1
join table2 as t2 on table1.a = table2.a
join table3 as t3 on table2.b = table3.b
ORDER BY t1.a
;
select t1.*, t2.*, t3.*
from table1 as t1
join table2 as t2 on table1.a = table2.a
join table3 as t3 on table2.b = table3.b
ORDER BY t1.a
FORMAT PrettyCompactNoEscapes;
select *
from table1 as t1
join table2 as t2 on t1.a = t2.a
join table3 as t3 on t2.b = t3.b
ORDER BY t1.a
FORMAT PrettyCompactNoEscapes;
select t1.a as t1_a, t2.a as t2_a, t2.b as t2_b, t3.b as t3_b,
    (t1.a + table2.b) as t1_t2_x, (table1.a + table3.b) as t1_t3_x, (t2.b + t3.b) as t2_t3_x
from table1 as t1
join table2 as t2 on t1_a = t2_a
join table3 as t3 on t2_b = t3_b
ORDER BY t1.a
;
select count()
from table1 as t1
join table2 as t2 on t1.a = t2.a
join table3 as t3 on t2.b = t3.b
join table5 as t5 on t3.c = t5.c
WHERE t1.a in table_set;
