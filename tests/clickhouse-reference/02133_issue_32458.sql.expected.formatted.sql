SELECT *
FROM
    t1
INNER JOIN t2
    ON ((NULL = t1.key) = t2.id)
    AND (('' = t1.key) = t2.id);