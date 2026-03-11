select 'mt source table count()', count() from t_mt_source;
select '-- check result with local pipeline';
select count() from system.query_log where (current_database = currentDatabase() or has(databases, currentDatabase())) and type = 'QueryFinish' and query_kind = 'Insert' and log_comment='c1fcb43d-1703-4ddb-b353-c8079b405c16' and event_date >= yesterday();
select count() from t_rmt_target;
select * from t_rmt_target order by k
except
select * from t_mt_source order by k;
