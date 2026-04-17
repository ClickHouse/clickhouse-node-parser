-- Tags: long, no-shared-merge-tree
-- no-shared-merge-tree: depend on replication queue/fetches

SET insert_keeper_fault_injection_probability=0; -- disable fault injection; part ids are non-deterministic in case of insert retries
drop table if exists rmt1;
drop table if exists rmt2;
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
insert into rmt1 values (1);
-- trigger log rotation, rmt1 will be lost
insert into rmt2 values (2);
insert into rmt2 values (3);
insert into rmt2 values (4);
insert into rmt2 values (5);
-- check that entry was not removed from the queue (part is not lost)
set receive_timeout=5;
set receive_timeout=300;
select 1, arraySort(groupArray(n)) from rmt2;
-- check that no parts are lost
select 2, arraySort(groupArray(n)) from rmt1;
select 3, arraySort(groupArray(n)) from rmt2;
truncate table rmt1;
truncate table rmt2;
insert into rmt2 values (1);
-- give it a chance to remove source parts
select sleep(2) format Null; -- increases probability of reproducing the issue
-- trigger log rotation, rmt2 will be lost
insert into rmt1 values (3);
insert into rmt1 values (4);
insert into rmt1 values (5);
select 4, arraySort(groupArray(n)) from rmt1;
-- check that no parts are lost
select 5, arraySort(groupArray(n)) from rmt1;
select 6, arraySort(groupArray(n)) from rmt2;
insert into rmt1 values (123);
alter table rmt1 update n=10 where n=123 settings mutations_sync=1;
-- trigger log rotation, rmt1 will be lost
insert into rmt2 values (20);
insert into rmt2 values (30);
insert into rmt2 values (40);
insert into rmt2 values (50);
select 7, arraySort(groupArray(n)) from rmt2;
-- check that no parts are lost
select 8, arraySort(groupArray(n)) from rmt1;
select 9, arraySort(groupArray(n)) from rmt2;
-- insert parts (all_18_18_0, all_19_19_0) on both replicas (will be deduplicated, but it does not matter)
insert into rmt1 values (100);
insert into rmt2 values (100);
insert into rmt1 values (200);
insert into rmt2 values (200);
-- create a gap in block numbers by dropping part
insert into rmt2 values (300);
alter table rmt2 drop part 'all_19_19_0';   -- remove 200
insert into rmt2 values (400);
insert into rmt2 values (500);
insert into rmt2 values (600);
-- give it a chance to cleanup log

select sleepEachRow(2) from url('http://localhost:8123/?param_tries={1..10}&query=' || encodeURLComponent(
            'select value from system.zookeeper where path=''/test/02448/' || currentDatabase() || '/rmt/replicas/1'' and name=''is_lost'' and value=''0'''
    ), 'LineAsString', 's String') settings max_threads=1, http_make_head_request=0 format Null;
-- rmt1 should not show the value (200) from dropped part
select throwIf(n = 200) from rmt1 format Null;
select 11, arraySort(groupArray(n)) from rmt2;
select 12, arraySort(groupArray(n)) from rmt1;
drop table rmt1;
drop table rmt2;
