select * from data final prewhere indexHint(_partition_id = 'all') or indexHint(_partition_id = 'all');
select * from data final prewhere indexHint(_partition_id = 'all') or indexHint(_partition_id = 'all') or indexHint(_partition_id = 'all');
