SELECT '----HORIZONTAL MERGE TESTS----';

SELECT COUNT(*)
FROM zero_rows_per_granule1;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule1'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM zero_rows_per_granule2;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule2'
    AND database = currentDatabase()
    AND active = 1;

SELECT sleep(0.7)
FORMAT Null;

SELECT COUNT(*)
FROM four_rows_per_granule1;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule1'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM four_rows_per_granule2;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule2'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM adaptive_granularity_alter1;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter1'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM adaptive_granularity_alter2;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter2'
    AND database = currentDatabase()
    AND active = 1;

SELECT
    k,
    v2
FROM adaptive_granularity_alter1
WHERE k >= 100
    OR k = 42
ORDER BY k ASC;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter1'
    AND database = currentDatabase()
    AND active = 1;

SELECT
    k,
    v2
FROM adaptive_granularity_alter2
WHERE k >= 100
    OR k = 42
ORDER BY k ASC;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter2'
    AND database = currentDatabase()
    AND active = 1;