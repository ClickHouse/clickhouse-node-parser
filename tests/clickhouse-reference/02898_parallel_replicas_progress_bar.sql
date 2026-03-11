-- default coordinator
SELECT count(), min(k), max(k), avg(k) FROM t1 SETTINGS log_comment='02898_default_190aed82-2423-413b-ad4c-24dcca50f65b';
SELECT count() > 0 FROM system.text_log
WHERE query_id in (select query_id from system.query_log where current_database = currentDatabase() AND log_comment='02898_default_190aed82-2423-413b-ad4c-24dcca50f65b' and event_date >= yesterday())
    AND message LIKE '%Total rows to read: 3000%' AND event_date >= yesterday();
-- reading in order coordinator
-- disable parallel_replicas_local_plan since the test relay on traces which only present in case of no local plan
SELECT k, sipHash64(v) FROM t1 order by k limit 5 offset 998 SETTINGS optimize_read_in_order=1, log_comment='02898_inorder_190aed82-2423-413b-ad4c-24dcca50f65b';
SELECT count() > 0 FROM system.text_log
WHERE query_id in (select query_id from system.query_log where current_database = currentDatabase() AND log_comment='02898_inorder_190aed82-2423-413b-ad4c-24dcca50f65b' and event_date >= yesterday())
    AND message LIKE '%Updated total rows to read: added % rows, total 3000 rows%' AND event_date >= yesterday();
