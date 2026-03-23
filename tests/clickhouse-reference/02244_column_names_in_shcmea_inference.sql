insert into function file(currentDatabase() || '_test_02244', 'TSV', 'x String, y UInt32') select 'Hello, world!', 42 settings engine_file_truncate_on_insert=1;
insert into function file(currentDatabase() || '_test_02244', 'CSV', 'x String, y UInt32') select 'Hello, world!', 42 settings engine_file_truncate_on_insert=1;
insert into function file(currentDatabase() || '_test_02244', 'JSONCompactEachRow', 'x String, y UInt32') select 'Hello, world!', 42 settings engine_file_truncate_on_insert=1;
insert into function file(currentDatabase() || '_test_02244', 'Values', 'x String, y UInt32') select 'Hello, world!', 42 settings engine_file_truncate_on_insert=1;
