select sum(b) from t_multi_prewhere prewhere a < 5000;
select ProfileEvents['FileOpen'] from system.query_log
where
    type = 'QueryFinish'
    and current_database = currentDatabase()
    and query ilike '%select sum(b) from t_multi_prewhere prewhere a < 5000%';
