select count(), sum(n) from merge(currentDatabase(), 'src_table');
-- FIXME #21401 select count(), sum(n) from merge(currentDatabase(), 'src_table') where _table = 'src_table_1' or toInt8(substr(_table, 11, 1)) = 2;
select count(), sum(n) from merge(currentDatabase(), 'src_table') where _table in ('src_table_2', 'src_table_3');
select count(), sum(n) from merge(currentDatabase(), 'src_table') where _table in ('src_table_2', 'src_table_3') and n % 20 = 0;
select count(), sum(n) from merge(currentDatabase(), 'src_table') where _table in set;
select count(), sum(n) from merge(currentDatabase(), 'src_table') where _table in tmp;
select count(), sum(n) from merge(currentDatabase(), 'src_table') where _table in set and n % 2 = 0;
select count(), sum(n) from merge(currentDatabase(), 'src_table') where n % 2 = 0 and _table in tmp;
