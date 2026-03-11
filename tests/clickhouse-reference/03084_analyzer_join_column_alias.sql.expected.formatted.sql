SELECT any(t2.date) AS any_val
FROM
    t1 AS t1
LEFT JOIN t2 AS t2
    ON (t1.user_id = t2.user_id);