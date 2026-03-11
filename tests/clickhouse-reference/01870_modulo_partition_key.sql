SELECT toInt64(partition) as p FROM system.parts WHERE table='table1' and database=currentDatabase() ORDER BY p;
select id from table1 where id % 200 = 2 OR id % 200 = -2 order by id;
select id from table1 where id % 200 > 0 order by id;
select id from table1 where id % 200 < 0 order by id;
SELECT partition as p FROM system.parts WHERE table='table2' and database=currentDatabase() ORDER BY p;
SELECT partition as p FROM system.parts WHERE table='table3' and database=currentDatabase() ORDER BY p;
SELECT count() FROM table4 WHERE id % 10 = 7;
SELECT v, v-205 as vv, modulo(vv, 200), moduloLegacy(vv, 200) FROM table1 ORDER BY v;
