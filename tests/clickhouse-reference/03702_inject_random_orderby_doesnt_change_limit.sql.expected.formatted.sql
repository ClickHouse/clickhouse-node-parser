-- Expect that these queries don't time out
SELECT number
FROM `system`.numbers
LIMIT 1;

SELECT number
FROM `system`.numbers
LIMIT 1
UNION ALL
SELECT number
FROM `system`.numbers
LIMIT 1;