SELECT
    table,
    name,
    concat('Emtpy : ', if(marks_bytes == 0, 'true', 'false'))
FROM `system`.data_skipping_indices
WHERE table = 'test_compact'
    AND database = currentDatabase()
    AND name = 'idx_minmax';

SELECT
    table,
    name,
    concat('Emtpy : ', if(marks_bytes == 0, 'true', 'false'))
FROM `system`.data_skipping_indices
WHERE table = 'test_wide'
    AND database = currentDatabase()
    AND name = 'idx_minmax';