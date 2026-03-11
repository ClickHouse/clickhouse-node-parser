select lost_part_count from system.replicas where database = currentDatabase() and table = 'rmt2';
select count() from system.text_log where logger_name like '%' || currentDatabase() || '%' and message ilike '%table with non-zero lost_part_count equal to%';
