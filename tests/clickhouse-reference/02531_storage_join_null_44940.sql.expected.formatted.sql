SELECT *
FROM
    t1__fuzz_8
FULL JOIN full_join__fuzz_4
    USING (x)
ORDER BY
    x DESC,
    str ASC,
    s ASC;