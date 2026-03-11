SELECT *
FROM users AS u1
WHERE uid = (
        SELECT sum(age)
        FROM users AS u2
        WHERE u1.name = u2.name
    );