SELECT *
FROM
    t1__fuzz_0
RIGHT JOIN right_join__fuzz_0
    USING (x)
QUALIFY x = 1;