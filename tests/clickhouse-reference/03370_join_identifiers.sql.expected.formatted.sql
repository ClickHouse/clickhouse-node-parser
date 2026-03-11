SELECT SUM(t1.rev) AS aggr
FROM
    t1
INNER JOIN t0 AS right_0
    ON t1.id = right_0.id
INNER JOIN t1 AS right_1
    ON t1.id = right_1.id;