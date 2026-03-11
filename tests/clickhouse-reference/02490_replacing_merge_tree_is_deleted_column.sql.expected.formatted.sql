SELECT *
FROM test FINAL
ORDER BY uid ASC;

SELECT *
FROM test
ORDER BY uid ASC;

SELECT *
FROM test
WHERE is_deleted = 0
ORDER BY uid ASC;

SELECT *
FROM testCleanupR1
ORDER BY uid ASC;

SELECT *
FROM testSettingsR1
WHERE is_deleted = 0
ORDER BY col1 ASC;

SELECT
    'no cleanup 1',
    *
FROM test FINAL
ORDER BY uid ASC;

SELECT
    'no cleanup 2',
    *
FROM test
ORDER BY uid ASC;

SELECT
    'no cleanup 3',
    *
FROM test FINAL
ORDER BY uid ASC;

SELECT
    'no cleanup 4',
    *
FROM test
ORDER BY uid ASC;

SELECT *
FROM testMT
ORDER BY uid ASC;

SELECT *
FROM testSummingMT
ORDER BY uid ASC;

SELECT *
FROM testAggregatingMT
ORDER BY uid ASC;

SELECT *
FROM testCollapsingMT
ORDER BY uid ASC;

SELECT *
FROM testVersionedCMT
ORDER BY uid ASC;