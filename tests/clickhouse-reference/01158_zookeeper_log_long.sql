select address, type, has_watch, op_num, path, is_ephemeral, is_sequential, version, requests_size, request_idx, error, watch_type,
       watch_state, path_created, stat_version, stat_cversion, stat_dataLength, stat_numChildren
from system.zookeeper_log where path like '/test/01158/' || currentDatabase() || '/rmt/log%' and op_num not in (3, 4, 12, 500)
order by xid, type, request_idx;
select count()>0 from system.zookeeper_log where path like '/test/01158/' || currentDatabase() || '/rmt%' and duration_microseconds > 0;
select sum(errors[0]) > 0, sum(average_latency) > 0 from system.aggregated_zookeeper_log where parent_path = '/test/01158/' || currentDatabase() || '/rmt' and operation = 'Create';
