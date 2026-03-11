SELECT
    *,
    oldest_before(users.age)
FROM users;