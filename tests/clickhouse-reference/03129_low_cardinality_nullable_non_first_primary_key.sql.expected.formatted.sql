SELECT SUM(dt::int)
FROM small
WHERE isNull(user_email);