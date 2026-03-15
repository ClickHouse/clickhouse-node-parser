create table tab (id UUID, value UInt32) engine = MergeTree PARTITION BY id order by tuple();
-- Here we check that partition id for UUID partition key did not change.
-- Different result means Backward Incompatible Change. Old partitions will not be accepted by new server.
select partition_id from system.parts where table = 'tab' and database = currentDatabase();
