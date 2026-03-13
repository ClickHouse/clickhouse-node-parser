SELECT
    t1.k,
    t2.x,
    t3.x
FROM
    adaptive_spill_03277_1 AS t1
LEFT JOIN adaptive_spill_03277_2 AS t2
    ON t1.k = t2.k
LEFT JOIN adaptive_spill_03277_3 AS t3
    ON t1.k = t3.k
FORMAT Null; --{serverError MEMORY_LIMIT_EXCEEDED}