SELECT s
FROM
    nested_test AS t1
ARRAY JOIN nest
INNER JOIN join_test AS t2
    ON nest.y = t2.y
ORDER BY `ALL` ASC;