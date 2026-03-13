-- Tags: no-random-merge-tree-settings
----- Group of very similar simple tests ------
SELECT '----HORIZONTAL MERGE TESTS----';

SELECT COUNT(*)
FROM zero_rows_per_granule;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM two_rows_per_granule;

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

SELECT COUNT(*)
FROM huge_granularity_small_blocks;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'huge_granularity_small_blocks'
    AND database = currentDatabase()
    AND active = 1;

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
    OR k = 42
ORDER BY k ASC;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter'
    AND database = currentDatabase()
    AND active = 1;