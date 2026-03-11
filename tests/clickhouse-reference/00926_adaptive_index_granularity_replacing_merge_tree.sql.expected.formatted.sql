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
FROM two_rows_per_granule FINAL;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'two_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM four_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT sleep(0.5)
FORMAT Null;

SELECT COUNT(*)
FROM four_rows_per_granule FINAL;

SELECT COUNT(*)
FROM huge_granularity_small_blocks;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'huge_granularity_small_blocks'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM huge_granularity_small_blocks FINAL;

SELECT COUNT(*)
FROM adaptive_granularity_alter;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter'
    AND database = currentDatabase()
    AND active = 1;

SELECT
    k,
    v2
FROM adaptive_granularity_alter
WHERE k >= 100
    OR k = 42;