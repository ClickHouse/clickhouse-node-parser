SELECT granularity
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 'tab'
    AND name = 'idx';