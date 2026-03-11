SELECT
    name,
    (
        SELECT count()
        FROM numbers(50)
        WHERE number = age
    )
FROM users
ORDER BY name ASC;