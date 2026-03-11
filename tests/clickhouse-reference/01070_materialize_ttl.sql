-- TTL should not be applied
select * from ttl order by a;
select * from ttl order by i;
select i, s from ttl order by i;
