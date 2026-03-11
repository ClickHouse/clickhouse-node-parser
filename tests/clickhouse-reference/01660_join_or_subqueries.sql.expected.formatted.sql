SELECT a1
FROM
    tab1
LEFT JOIN (
        SELECT *
        FROM tab2
    )
    ON b1 = a2
    OR b2 = a1;

SELECT a1
FROM
    tab1
LEFT JOIN (
        SELECT
            a2,
            b2
        FROM tab2
    )
    ON b1 = a2
    OR b2 = a1;

SELECT
    a1,
    b1
FROM
    tab1
LEFT JOIN (
        SELECT *
        FROM tab2
    )
    ON b1 = a2
    OR b2 = a1;

SELECT
    a1,
    b1,
    a2,
    b2
FROM
    tab1
LEFT JOIN (
        SELECT
            *,
            a2 AS z
        FROM tab2
    )
    ON b1 + 1 = z + 1
    OR b1 = z * 2;

SELECT
    a1,
    b1,
    a2,
    b2
FROM
    tab1
LEFT JOIN (
        SELECT
            *,
            a2 + 1 AS z
        FROM tab2
    )
    ON b1 + 1 = z
    OR b1 = z * 2;