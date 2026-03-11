SELECT is_done FROM system.mutations where database = currentDatabase() and table = 'table_for_synchronous_mutations1';
SELECT is_done FROM system.mutations where database = currentDatabase() and table = 'table_for_synchronous_mutations_no_replication';
