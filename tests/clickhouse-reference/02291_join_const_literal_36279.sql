SELECT COUNT() AS count
FROM test_distributed
INNER JOIN
(
    SELECT text
    FROM test_distributed
    WHERE (text ILIKE '%text-for-search%') AND (text2 ILIKE '%text-for-search%')
) USING (text)
WHERE (text ILIKE '%text-for-search%') AND (text2 ILIKE '%text-for-search%')
;
SELECT
  u.name user_name,
  20 AS age_group
FROM user_all u
LEFT JOIN event e ON u.id = e.user_id
WHERE (u.age >= 20 AND u.age < 30)
AND e.created_time > '2022-01-01';
