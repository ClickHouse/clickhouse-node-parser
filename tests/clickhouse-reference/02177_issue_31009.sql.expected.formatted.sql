SELECT
    key,
    count(1) AS cnt
FROM (
        SELECT data.key
        FROM
            (
                SELECT key
                FROM `left` AS s
            ) AS data
        LEFT JOIN (
                SELECT key
                FROM `right`
                GROUP BY key
            ) AS promo
            ON promo.key = data.key
    )
GROUP BY key
HAVING count(1) > 1;