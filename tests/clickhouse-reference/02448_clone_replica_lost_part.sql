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
