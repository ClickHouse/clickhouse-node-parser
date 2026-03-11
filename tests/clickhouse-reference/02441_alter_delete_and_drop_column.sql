-- a funny way to wait for a MUTATE_PART to be assigned
select sleepEachRow(2) from url('http://localhost:8123/?param_tries={1..10}&query=' || encodeURLComponent(
            'select 1 where ''MUTATE_PART'' not in (select type from system.replication_queue where database=''' || currentDatabase() || ''' and table=''mut'')'
    ), 'LineAsString', 's String') settings max_threads=1, http_make_head_request=0 format Null;
-- a funny way to wait for ALTER_METADATA to disappear from the replication queue
select sleepEachRow(2) from url('http://localhost:8123/?param_tries={1..10}&query=' || encodeURLComponent(
    'select * from system.replication_queue where database=''' || currentDatabase() || ''' and table=''mut'' and type=''ALTER_METADATA'''
    ), 'LineAsString', 's String') settings max_threads=1, http_make_head_request=0 format Null;
select type, new_part_name, parts_to_merge from system.replication_queue where database=currentDatabase() and table='mut' and type != 'GET_PART';
select * from mut;
