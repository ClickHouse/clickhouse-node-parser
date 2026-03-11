SELECT COUNT(*)
FROM zero_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM zero_rows_per_granule FINAL;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT '-----';

SELECT COUNT(*)
FROM four_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;