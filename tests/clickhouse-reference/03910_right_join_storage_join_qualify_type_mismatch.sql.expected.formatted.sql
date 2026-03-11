SELECT *
FROM
    t1
RIGHT JOIN right_join
    USING (x)
QUALIFY x = 1;