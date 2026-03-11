select sleepEachRow(3) as higher_probability_of_reproducing_the_issue format Null;
-- it should not list unneeded partitions where we cannot merge anything
select * from system.zookeeper_log where path like '/test/02439/' || getMacro('shard') || '/' || currentDatabase() || '/block_numbers/%'
    and op_num in ('List', 'SimpleList', 'FilteredList')
    and path not like '%/block_numbers/1' and path not like '%/block_numbers/123'
    and event_time >= now() - interval 1 minute
    -- avoid race with tests like 02311_system_zookeeper_insert
    and (query_id is null or query_id='' or query_id in
            (select query_id from system.query_log
             where event_time >= now() - interval 1 minute and current_database=currentDatabase())
        );
