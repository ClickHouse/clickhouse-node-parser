select * from ttl order by a;
select delete_ttl_info_min, delete_ttl_info_max  from system.parts where database = currentDatabase() and table = 'ttl' and active > 0 order by name asc;
select * from ttl order by i;
select delete_ttl_info_min, delete_ttl_info_max  from system.parts where database = currentDatabase() and table = 'ttl' and active > 0;
select i, s from ttl order by i;
select i, s, t from ttl order by i;
-- MATERIALIZE TTL ran only once
select count() from system.mutations where database = currentDatabase() and table = 'ttl' and is_done;
