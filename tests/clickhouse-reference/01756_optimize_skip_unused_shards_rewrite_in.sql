select splitByString('IN', query)[-1] from system.query_log where
    event_date >= yesterday() and
    event_time > now() - interval 1 hour and
    not is_initial_query and
    query not like '%system%query_log%' and
    query like concat('%', currentDatabase(), '%AS%id_no%') and
    type = 'QueryFinish'
order by query;
select splitByString('IN', query)[-1] from system.query_log where
    event_date >= yesterday() and
    event_time > now() - interval 1 hour and
    not is_initial_query and
    query not like '%system%query_log%' and
    query like concat('%', currentDatabase(), '%AS%id_02%') and
    type = 'QueryFinish'
order by query;
select splitByString('IN', query)[-1] from system.query_log where
    event_date >= yesterday() and
    event_time > now() - interval 1 hour and
    not is_initial_query and
    query not like '%system%query_log%' and
    query like concat('%', currentDatabase(), '%AS%id_2%') and
    type = 'QueryFinish'
order by query;
select splitByString('IN', query)[-1] from system.query_log where
    event_date >= yesterday() and
    event_time > now() - interval 1 hour and
    not is_initial_query and
    query not like '%system%query_log%' and
    query like concat('%', currentDatabase(), '%AS%id_00%') and
    type = 'QueryFinish'
order by query;
select splitByString('IN', query)[-1] from system.query_log where
    event_date >= yesterday() and
    event_time > now() - interval 1 hour and
    not is_initial_query and
    query not like '%system%query_log%' and
    query like concat('%', currentDatabase(), '%AS%key_signed%') and
    type = 'QueryFinish'
order by query;
-- not tuple
select * from dist_01756 where dummy in (0);
select * from dist_01756 where dummy in ('0');
-- optimize_skip_unused_shards does not support non-constants
select * from dist_01756 where dummy in (select * from system.one); -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
-- this is a constant for analyzer
select * from dist_01756 where dummy in (toUInt8(0)) settings enable_analyzer=0; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
-- NOT IN does not supported
select * from dist_01756 where dummy not in (0, 2); -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
select * from dist_01756 where dummy not in (2, 3) and dummy in (0, 2);
select * from dist_01756 where dummy in tuple(0, 2);
select * from dist_01756 where dummy in tuple(0);
select * from dist_01756 where dummy in tuple(2);
-- Identifier is NULL
select (2 IN (2,)), * from dist_01756 where dummy in (0, 2) format Null;
-- Literal is NULL
select (dummy IN (toUInt8(2),)), * from dist_01756 where dummy in (0, 2) format Null;
-- different type
select 'different types -- prohibited';
select * from dist_01756_str where key in ('0', '2');
select * from dist_01756_str where key in (0, 2);
-- analyzer does support this
select * from dist_01756_str where key in ('0', Null) settings enable_analyzer=0; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
select * from dist_01756_column where dummy in (0, '255');
select * from dist_01756_column where dummy in (0, '255foo'); -- { serverError TYPE_MISMATCH }
-- intHash64 does not accept string, but implicit conversion should be done
select * from dist_01756 where dummy in ('0', '2');
select * from dist_01756 where dummy in (0, 2) settings optimize_skip_unused_shards_limit=1; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
select * from dist_01756 where dummy in (0, 2) settings optimize_skip_unused_shards_limit=1, force_optimize_skip_unused_shards=0;
