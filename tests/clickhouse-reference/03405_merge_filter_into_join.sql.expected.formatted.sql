SELECT *
FROM (
        SELECT *
        FROM
            users AS u1
        INNER JOIN users AS u2
            ON 1
    )
WHERE age = u2.age
ORDER BY `ALL` ASC;

SELECT *
FROM (
        SELECT *
        FROM
            users AS u1
        CROSS JOIN users AS u2
    )
WHERE age = u2.age
ORDER BY `ALL` ASC;