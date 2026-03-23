-- Tags: long, zookeeper, no-replicated-database, no-polymorphic-parts, no-random-merge-tree-settings, no-shared-merge-tree, no-async-insert
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- no-shared-merge-tree: depends on structure in zookeeper of replicated merge tree
-- no-async-insert: Test expects new part for each insert

SET insert_keeper_fault_injection_probability=0; -- disable fault injection; part ids are non-deterministic in case of insert retries
drop table if exists rmt sync;
-- cleanup code will perform extra Exists
-- (so the .reference will not match)
create table rmt (n int) engine=ReplicatedMergeTree('/test/01158/{database}/rmt', '1')
    order by n
    settings
        cleanup_delay_period=86400,
        max_cleanup_delay_period=86400,
        replicated_can_become_leader=0;
insert into rmt values (1);
select address, type, has_watch, op_num, path, is_ephemeral, is_sequential, version, requests_size, request_idx, error, watch_type,
       watch_state, path_created, stat_version, stat_cversion, stat_dataLength, stat_numChildren
from system.zookeeper_log where path like '/test/01158/' || currentDatabase() || '/rmt/log%' and op_num not in (3, 4, 12, 500)
order by xid, type, request_idx;
drop table rmt sync;
select count()>0 from system.zookeeper_log where path like '/test/01158/' || currentDatabase() || '/rmt%' and duration_microseconds > 0;
select sum(errors[0]) > 0, sum(average_latency) > 0 from system.aggregated_zookeeper_log where parent_path = '/test/01158/' || currentDatabase() || '/rmt' and operation = 'Create';
