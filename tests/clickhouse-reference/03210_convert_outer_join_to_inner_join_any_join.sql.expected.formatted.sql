SELECT *
FROM
    user_transactions
LEFT JOIN user_country
    USING (user_id)
WHERE user_id = 1
    AND country = 'US'
ORDER BY `ALL` ASC;