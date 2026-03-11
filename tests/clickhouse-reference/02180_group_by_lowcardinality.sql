select val, avg(toUInt32(val)) from t_group_by_lowcardinality group by val limit 10 settings max_threads=1, max_rows_to_group_by=100, group_by_overflow_mode='any' format JSONEachRow;
