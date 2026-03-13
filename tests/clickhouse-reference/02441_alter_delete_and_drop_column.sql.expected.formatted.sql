-- a funny way to wait for a MUTATE_PART to be assigned
SELECT sleepEachRow(2)
FROM url(concat('http://localhost:8123/?param_tries={1..10}&query=', encodeURLComponent(concat('select 1 where ''MUTATE_PART'' not in (select type from system.replication_queue where database=''', currentDatabase(), ''' and table=''mut'')'))), 'LineAsString', 's String')
SETTINGS
    max_threads = 1,
    http_make_head_request = 0
FORMAT Null;

-- a funny way to wait for ALTER_METADATA to disappear from the replication queue
SELECT sleepEachRow(2)
FROM url(concat('http://localhost:8123/?param_tries={1..10}&query=', encodeURLComponent(concat('select * from system.replication_queue where database=''', currentDatabase(), ''' and table=''mut'' and type=''ALTER_METADATA'''))), 'LineAsString', 's String')
SETTINGS
    max_threads = 1,
    http_make_head_request = 0
FORMAT Null;

SELECT
    type,
    new_part_name,
    parts_to_merge
FROM `system`.replication_queue
WHERE database = currentDatabase()
    AND table = 'mut'
    AND type != 'GET_PART';

SELECT *
FROM mut;