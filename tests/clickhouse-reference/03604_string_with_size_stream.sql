-- Old string type also supports .size subcolumn
select s.size from test;
-- system.parts_columns table only lists physical subcolumns/substreams
select column, substreams, subcolumns.names, subcolumns.types from system.parts_columns where database = currentDatabase() and table = 'test' and active order by column;
select s.size, s from test_old where y > 5 order by y limit 2;
select s, s.size from test_old where y > 5 order by y limit 2;
select s.size, s from test_new where y > 5 order by y limit 2;
select s, s.size from test_new where y > 5 order by y limit 2;
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_old_compact order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_old_compact order by all limit 2 offset 3;
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_old_wide order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_old_wide order by all limit 2 offset 3;
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_new_compact order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_new_compact order by all limit 2 offset 3;
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_new_wide order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_new_wide order by all limit 2 offset 3;
select s != '' from t_column_names;
