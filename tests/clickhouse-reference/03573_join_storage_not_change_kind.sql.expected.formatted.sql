SELECT
    event.message,
    user.name,
    user.age
FROM
    events AS event
LEFT JOIN users AS user
    ON event.user_id = user.uid
WHERE user.uid > 0
ORDER BY user.age ASC;