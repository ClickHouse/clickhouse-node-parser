SELECT filenames
FROM `system`.parts_columns
WHERE table = 'test'
    AND database = currentDatabase();