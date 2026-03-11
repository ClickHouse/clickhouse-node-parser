SELECT
    dt6,
    dt3,
    dt6 > dt3,
    dt6 >= dt3,
    dt6 = dt3,
    dt6 <= dt3,
    dt6 < dt3,
    dt6 != dt3
FROM datetime64_cmp
ORDER BY
    dt6 ASC,
    dt3 ASC;