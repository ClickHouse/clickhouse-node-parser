SELECT explain FROM
(
EXPLAIN keep_logical_steps=1, actions=1
SELECT *
FROM t1
JOIN (SELECT key1 AS key, sum(value) FROM t2 GROUP BY key) AS tt2
ON t1.n = tt2.key
)
WHERE explain LIKE '% Join%' OR explain LIKE '% ResultRows:%' OR explain LIKE '% ReadFromMergeTree%' OR explain LIKE '% Aggregating%';
SELECT explain FROM
(
EXPLAIN keep_logical_steps=1, actions=1
SELECT *
FROM t1
JOIN (SELECT key1, key2, sum(value) FROM t2 GROUP BY key1, key2) AS tt2
ON t1.n = tt2.key1
)
WHERE explain LIKE '% Join%' OR explain LIKE '% ResultRows:%' OR explain LIKE '% ReadFromMergeTree%' OR explain LIKE '% Aggregating%';
SELECT explain FROM
(
EXPLAIN keep_logical_steps=1, actions=1
SELECT *
FROM t1
JOIN (SELECT key1, key3, sum(value) FROM t2 GROUP BY key1, key3) AS tt2
ON t1.n = tt2.key1
)
WHERE explain LIKE '% Join%' OR explain LIKE '% ResultRows:%' OR explain LIKE '% ReadFromMergeTree%' OR explain LIKE '% Aggregating%';
SELECT explain FROM
(
EXPLAIN keep_logical_steps=1, actions=1
SELECT *
FROM t1
JOIN (SELECT 7 AS key, sum(value) FROM t2) AS tt2
ON t1.n = tt2.key
)
WHERE explain LIKE '% Join%' OR explain LIKE '% ResultRows:%' OR explain LIKE '% ReadFromMergeTree%' OR explain LIKE '% Aggregating%';
