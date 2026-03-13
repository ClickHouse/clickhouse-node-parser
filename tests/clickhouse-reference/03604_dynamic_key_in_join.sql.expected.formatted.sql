SELECT *
FROM
    t0
INNER JOIN t1
    ON t0.c0 = t1.c0; -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM
    t0
INNER JOIN t1
    ON t0.c1 = t1.c1; -- {serverError ILLEGAL_COLUMN}

SELECT *
FROM
    t0
INNER JOIN t1
    ON t0.c2 = t1.c2; -- {serverError ILLEGAL_COLUMN}