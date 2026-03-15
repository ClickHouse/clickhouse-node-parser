-- Tags: long, no-shared-merge-tree
-- no-shared-merge-tree: depend on replication queue/fetches

SET insert_keeper_fault_injection_probability=0; -- disable fault injection; part ids are non-deterministic in case of insert retries
create table rmt1 (n int) engine=ReplicatedMergeTree('/test/02448/{database}/rmt', '1') order by tuple()
    settings min_replicated_logs_to_keep=1, max_replicated_logs_to_keep=2,
    max_cleanup_delay_period=1, cleanup_delay_period=0, cleanup_delay_period_random_add=1,
    cleanup_thread_preferred_points_per_iteration=0, old_parts_lifetime=0, max_parts_to_merge_at_once=4,
    merge_selecting_sleep_ms=1000, max_merge_selecting_sleep_ms=2000;
create table rmt2 (n int) engine=ReplicatedMergeTree('/test/02448/{database}/rmt', '2') order by tuple()
    settings min_replicated_logs_to_keep=1, max_replicated_logs_to_keep=2,
    max_cleanup_delay_period=1, cleanup_delay_period=0, cleanup_delay_period_random_add=1,
    cleanup_thread_preferred_points_per_iteration=0, old_parts_lifetime=0, max_parts_to_merge_at_once=4,
    merge_selecting_sleep_ms=1000, max_merge_selecting_sleep_ms=2000;
-- check that entry was not removed from the queue (part is not lost)
set receive_timeout=5;
set receive_timeout=300;
select 1, arraySort(groupArray(n)) from rmt2;
-- check that no parts are lost
select 2, arraySort(groupArray(n)) from rmt1;
select 3, arraySort(groupArray(n)) from rmt2;
-- give it a chance to remove source parts
select sleep(2) format Null; -- increases probability of reproducing the issue
select 4, arraySort(groupArray(n)) from rmt1;
-- check that no parts are lost
select 5, arraySort(groupArray(n)) from rmt1;
select 6, arraySort(groupArray(n)) from rmt2;
select 7, arraySort(groupArray(n)) from rmt2;
-- check that no parts are lost
select 8, arraySort(groupArray(n)) from rmt1;
select 9, arraySort(groupArray(n)) from rmt2;
-- give it a chance to cleanup log

select sleepEachRow(2) from url('http://localhost:8123/?param_tries={1..10}&query=' || encodeURLComponent(
            'select value from system.zookeeper where path=''/test/02448/' || currentDatabase() || '/rmt/replicas/1'' and name=''is_lost'' and value=''0'''
    ), 'LineAsString', 's String') settings max_threads=1, http_make_head_request=0 format Null;
-- rmt1 should not show the value (200) from dropped part
select throwIf(n = 200) from rmt1 format Null;
select 11, arraySort(groupArray(n)) from rmt2;
select 12, arraySort(groupArray(n)) from rmt1;
