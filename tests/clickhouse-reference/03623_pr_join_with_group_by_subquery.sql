SELECT '-- subquery INNER JOIN table';
SELECT
    name,
    c
FROM
(
    SELECT
        user_id,
        count() AS c
    FROM messages
    GROUP BY user_id
) AS messages
INNER JOIN users ON messages.user_id = users.id
ORDER BY
    user_id ASC,
    c ASC;
SELECT
    name,
    c
FROM
users
INNER JOIN
(
    SELECT
        user_id,
        count() AS c
    FROM messages
    GROUP BY user_id
) AS messages
ON messages.user_id = users.id
ORDER BY
    user_id ASC,
    c ASC;
SELECT
    name,
    c
FROM
(
    SELECT
        user_id,
        count() AS c
    FROM messages
    GROUP BY user_id
) AS messages
LEFT JOIN users ON messages.user_id = users.id
ORDER BY
    user_id ASC,
    c ASC;
SELECT
    name,
    c
FROM
users
LEFT JOIN
(
    SELECT
        user_id,
        count() AS c
    FROM messages
    GROUP BY user_id
) AS messages
ON messages.user_id = users.id
ORDER BY
    user_id ASC,
    c ASC;
SELECT
    name,
    c
FROM
(
    SELECT
        user_id,
        count() AS c
    FROM messages
    GROUP BY user_id
) AS messages
RIGHT JOIN users ON messages.user_id = users.id
ORDER BY
    user_id ASC,
    c ASC;
SELECT
    name,
    c
FROM
users
RIGHT JOIN
(
    SELECT
        user_id,
        count() AS c
    FROM messages
    GROUP BY user_id
) AS messages
ON messages.user_id = users.id
ORDER BY
    user_id ASC,
    c ASC;
