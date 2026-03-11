SELECT count(*)
FROM
    t5 AS ref_2
LEFT JOIN (
        SELECT ref_3.c_2_c48_2 AS c_6_c185_6
        FROM t4 AS ref_3
    ) AS subq_1
    ON (ref_2.c52 = subq_1.c_6_c185_6)
WHERE intExp2(ref_2.pkey) <= (multiIf(((subq_1.c_6_c185_6 = 1)
    AND (NOT subq_1.c_6_c185_6 = 1)), 0, hiveHash(ref_2.c56)));

SELECT count(*)
FROM
    t5 AS ref_2
LEFT JOIN (
        SELECT ref_3.c_2_c48_2 AS c_6_c185_6
        FROM t4 AS ref_3
    ) AS subq_1
    ON (ref_2.c52 = subq_1.c_6_c185_6)
WHERE intExp2(ref_2.pkey) <= hiveHash(ref_2.c56);