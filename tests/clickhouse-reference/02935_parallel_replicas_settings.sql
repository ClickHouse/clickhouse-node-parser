SELECT count() FROM test_parallel_replicas_settings WHERE NOT ignore(*); -- { serverError CLUSTER_DOESNT_EXIST }
SELECT count() FROM test_parallel_replicas_settings WHERE NOT ignore(*) settings log_comment='0_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f';
SELECT count() > 0 FROM system.text_log
WHERE yesterday() <= event_date
      AND query_id in (select query_id from system.query_log where current_database=currentDatabase() AND log_comment='0_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f')
      AND level = 'Information'
      AND message ILIKE '%Disabling ''use_hedged_requests'' in favor of ''enable_parallel_replicas''%'
SETTINGS enable_parallel_replicas=0;
SELECT count() FROM test_parallel_replicas_settings WHERE NOT ignore(*) settings log_comment='1_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f';
SELECT count() > 0 FROM system.text_log
WHERE yesterday() <= event_date
      AND query_id in (select query_id from system.query_log where current_database = currentDatabase() AND log_comment = '1_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f')
      AND level = 'Warning'
      AND message ILIKE '%Setting ''use_hedged_requests'' explicitly with enabled ''enable_parallel_replicas'' has no effect%'
SETTINGS enable_parallel_replicas=0;
