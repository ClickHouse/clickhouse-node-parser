-- In order version of LIMIT BY works only if analyzer enabled
SET enable_analyzer = 1;
CREATE TABLE 03701_unsorted (key UInt32, val UInt32, dt Date) engine=MergeTree ORDER BY tuple();
INSERT INTO 03701_unsorted SELECT intDiv(number, 2), number, '2025-05-05' FROM numbers(10);
INSERT INTO 03701_unsorted SELECT intDiv(number, 3) + 10, number, '2025-05-06' FROM numbers(9);
INSERT INTO 03701_unsorted SELECT number + 50, number, '2025-05-07' FROM numbers(500);
-- DISTINCT for explain outputs are required due to parallel replicas tests, as there
-- are created multiple LimitByTransforms (pushed down to replicas and the global one)

SELECT DISTINCT 'Unsorted ORDER BY key LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted ORDER BY key LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Unsorted ORDER BY key DESC LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted ORDER BY key DESC LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Unsorted ORDER BY key, val LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted ORDER BY key, val LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Unsorted ORDER BY val LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted ORDER BY val LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Unsorted ORDER BY val, key LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted ORDER BY val, key LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Unsorted ORDER BY key LIMIT BY key, val: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted ORDER BY key LIMIT 1 BY key, val LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Unsorted ORDER BY key, dt LIMIT BY key, val: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted ORDER BY key, dt LIMIT 1 BY key, val LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Unsorted w/o ORDER BY: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_unsorted LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT '-- Unsorted with LIMIT 1 BY';
SELECT key FROM 03701_unsorted ORDER BY key LIMIT 1 BY key LIMIT 10;
SELECT key FROM 03701_unsorted ORDER BY key LIMIT 2 BY key LIMIT 16;
CREATE TABLE 03701_sorted (key UInt32, val UInt32, dt Date) engine=MergeTree ORDER BY key;
INSERT INTO 03701_sorted SELECT intDiv(number, 2), number, '2025-05-05' FROM numbers(10);
INSERT INTO 03701_sorted SELECT intDiv(number, 3) + 10, number, '2025-05-06' FROM numbers(9);
INSERT INTO 03701_sorted SELECT number + 50, number, '2025-05-07' FROM numbers(500);
SELECT DISTINCT 'Sorted ORDER BY key LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted ORDER BY key LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Sorted ORDER BY key DESC LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted ORDER BY key DESC LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Sorted ORDER BY key, val LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted ORDER BY key, val LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Sorted ORDER BY val LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted ORDER BY val LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Sorted ORDER BY val, key LIMIT BY key: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted ORDER BY val, key LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Sorted ORDER BY key LIMIT BY key, val: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted ORDER BY key LIMIT 1 BY key, val LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Sorted ORDER BY key, dt LIMIT BY key, val: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted ORDER BY key, dt LIMIT 1 BY key, val LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT DISTINCT 'Sorted w/o ORDER BY: ' || trim(BOTH ' ' FROM explain)
FROM (EXPLAIN PIPELINE SELECT key FROM 03701_sorted LIMIT 1 BY key LIMIT 10)
WHERE explain LIKE '%LimitByTransform%';
SELECT key FROM 03701_sorted ORDER BY key LIMIT 1 BY key LIMIT 10;
SELECT key FROM 03701_sorted ORDER BY key LIMIT 2 BY key LIMIT 16;
