SELECT name, default_expression FROM system.columns WHERE database = currentDatabase() AND table = 'src_table' ORDER BY name;
SELECT * FROM src_table ORDER BY time FORMAT JSONEachRow;
SELECT * FROM copied_table ORDER BY time FORMAT JSONEachRow;
