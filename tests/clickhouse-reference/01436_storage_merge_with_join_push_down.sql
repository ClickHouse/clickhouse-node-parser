SELECT count() FROM test_merge
JOIN (SELECT 'anystring' AS name) AS n
USING name
WHERE id = 1;
