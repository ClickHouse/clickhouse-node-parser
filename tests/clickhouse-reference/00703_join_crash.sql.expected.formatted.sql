SELECT
    tab1.a1,
    tab1_copy.a1,
    tab1.b1
FROM
    tab1
LEFT JOIN tab1_copy
    ON tab1.b1 + 3 = tab1_copy.b1 + 2;