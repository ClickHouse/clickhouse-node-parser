SELECT
    a.key,
    sum(a.value),
    any(b.id)
FROM
    t_lc_join_a AS a
INNER JOIN t_lc_join_b AS b
    ON a.key = b.key
GROUP BY a.key
ORDER BY a.key ASC;