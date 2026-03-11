SELECT COUNT() AS count
FROM
    test_distributed
INNER JOIN (
        SELECT text
        FROM test_distributed
        WHERE (ilike(text, '%text-for-search%'))
            AND (ilike(text2, '%text-for-search%'))
    )
    USING (text)
WHERE (ilike(text, '%text-for-search%'))
    AND (ilike(text2, '%text-for-search%'));

SELECT
    u.name AS user_name,
    20 AS age_group
FROM
    user_all AS u
LEFT JOIN event AS e
    ON u.id = e.user_id
WHERE ((u.age >= 20
    AND u.age < 30))
    AND e.created_time > '2022-01-01';