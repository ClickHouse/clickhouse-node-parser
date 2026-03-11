select sleep(5) format Null;
select sleep(1) format Null;
-- to avoid flakiness we only check that number of logs < 20, instead of some strict values
select extractAll(logger_name, 'StorageBuffer \\([^.]+\\.([^)]+)\\)')[1] as table_name, max2(count(), 20) from system.text_log where logger_name LIKE format('%StorageBuffer ({}.%', currentDatabase()) group by 1 order by 1;
