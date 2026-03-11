-- Expected 3 rows, got only 1. Removing 'ANY' and adding 'FINAL' fixes
-- the issue (but it is not always possible). Moving filter by 'country' to
-- an outer query doesn't help. Query without filter by 'country' works
-- as expected (returns 3 rows).
SELECT * FROM user_transactions
ANY LEFT JOIN user_country USING (user_id)
WHERE
    user_id = 1
    AND country = 'US'
ORDER BY ALL;
