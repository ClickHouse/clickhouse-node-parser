SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all');

SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all');