SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    AND key >= -1
WHERE key >= 0;