SELECT *
FROM (
        SELECT DISTINCT json.`b[]`
        FROM test
    )
ORDER BY `all` ASC;