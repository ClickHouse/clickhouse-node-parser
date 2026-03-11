SELECT count() > 0
FROM merge_test
WHERE x NOT IN (12345, 67890);