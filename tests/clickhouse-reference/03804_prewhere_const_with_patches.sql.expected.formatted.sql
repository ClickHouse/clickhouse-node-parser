SELECT count()
FROM t_prewhere_const_patches
PREWHERE 18;

SELECT count()
FROM t_prewhere_const_patches
PREWHERE 1;

SELECT count()
FROM t_prewhere_const_patches
PREWHERE 0;

SELECT
    b,
    c,
    count()
FROM t_prewhere_const_patches
PREWHERE 18
GROUP BY
    b,
    c
ORDER BY
    b ASC,
    c ASC;