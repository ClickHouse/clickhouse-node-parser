SELECT *
FROM numbers(2)
WHERE isNull((
        SELECT count()
        FROM `system`.one
        WHERE number = 2
    ))
ORDER BY `all` ASC;