select 'system.distribution_queue', count() from system.distribution_queue where exists(select 1) and database = currentDatabase();
select 'system.rocksdb', count()>0 from system.rocksdb where exists(select 1) and database = currentDatabase();
select 'system.databases', count() from system.databases where exists(select 1) and database = currentDatabase();
select 'system.mutations', count() from system.mutations where exists(select 1) and database = currentDatabase();
select 'system.replication_queue', count()>0 from system.replication_queue where exists(select 1) and database = currentDatabase();
