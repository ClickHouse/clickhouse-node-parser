select * from data final prewhere indexHint(_partition_id = 'all') and key >= -1 where key >= 0;
