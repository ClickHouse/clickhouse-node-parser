SELECT count()
FROM
    distr AS l
LEFT JOIN distr AS r
    ON l.a = r.a;