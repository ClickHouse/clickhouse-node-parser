SELECT count(*)
FROM users
WINDOW
    w AS (ORDER BY uid),
    w AS (ORDER BY name);