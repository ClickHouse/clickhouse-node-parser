select name, active from system.parts where database='shard_0' and table='to' and active order by name;
-- Doesn't lead to test flakyness, because we don't check content in table
-- which doesn't depend on any background operation
select sleep(3);
select count(), sum(x) from shard_1.to;
