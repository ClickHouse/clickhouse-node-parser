SELECT is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'table_for_synchronous_mutations1';

SELECT is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'table_for_synchronous_mutations_no_replication';