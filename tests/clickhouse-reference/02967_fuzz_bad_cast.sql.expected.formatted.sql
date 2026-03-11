SELECT
    sum(0),
    NULL
FROM
    t0__fuzz_29
FULL JOIN t1__fuzz_4
    USING (x)
PREWHERE NULL;