SELECT *
FROM
    `03400_dist_users` AS l FINAL
LEFT JOIN (
        SELECT *
        FROM `03400_dist_users` AS d FINAL
    ) AS r
    ON l.uid = r.uid
ORDER BY l.version ASC
SETTINGS distributed_product_mode = 'local';