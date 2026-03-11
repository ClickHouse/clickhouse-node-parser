select * from ttl order by a;
select * from ttl order by i;
select i, s from ttl order by i;
select i, s, t from ttl order by i;
-- MATERIALIZE TTL ran only once
select count() from system.mutations where database = currentDatabase() and table = 'ttl' and is_done;
