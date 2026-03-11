-- { echo }
select sum(y) from (select * from remote('127.0.0.1', currentDatabase(), tab0)) where x in (select number + 42 from numbers(1));
select sum(y) from (select * from remote('127.0.0.1', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select sum(y) from (select * from remote('127.0.0.2', currentDatabase(), tab0)) where x in (select number + 42 from numbers(1));
select sum(y) from (select * from remote('127.0.0.2', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select sum(y) from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where x in (select number + 42 from numbers(1));
select sum(y) from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select sum(y) from (select * from remote('127.0.0.{2,3}', currentDatabase(), tab0)) where x in (select number + 42 from numbers(1));
select sum(y) from (select * from remote('127.0.0.{2,3}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select * from (explain indexes=1
    select sum(y) from (select * from remote('127.0.0.1', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1))
);
select * from (explain indexes=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.2', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1))
);
-- SKIP: current_database = currentDatabase()
select normalizeQuery(replace(query, currentDatabase(), 'default')) from system.query_log where event_date >= yesterday() and log_comment like '%' || currentDatabase() || '%' and not is_initial_query and type != 'QueryStart' and query_kind = 'Select' order by event_time_microseconds;
