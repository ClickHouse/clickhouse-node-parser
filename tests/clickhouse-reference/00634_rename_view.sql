create table test1_00634 (id UInt8) engine = TinyLog;
create table test2_00634 (id UInt8) engine = TinyLog;
create view v_test1 as select id from test1_00634;
create view v_test2 as select id from test2_00634;
SELECT name, engine FROM system.tables WHERE name IN ('v_test1', 'v_test2', 'v_test11', 'v_test22') AND database = currentDatabase() ORDER BY name;
