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

SELECT DISTINCT (marks) AS d
FROM `system`.parts
WHERE table = 'four_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1
HAVING d > 0;

SELECT COUNT(*)
FROM six_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'six_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT DISTINCT (marks) AS d
FROM `system`.parts
WHERE table = 'six_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1
HAVING d > 0;