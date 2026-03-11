SELECT *
FROM users u1
WHERE uid = (
    SELECT sum(age)
    FROM users u2
    WHERE u1.name = u2.name
);
