SELECT toTypeName(if(rand() % 2, floor(4373163444658715090), c_f7nvvq))
FROM test_if_type_mismatch
LIMIT 1;

SELECT toTypeName(multiIf(c_ooi4e9x212 > 5, floor(4373163444658715090), c_f7nvvq))
FROM test_if_type_mismatch
LIMIT 1;

SELECT subq_0.c_q9e4c4y15 AS c_n_2010
FROM (
        SELECT
            ref_0.c_ooi4e9x212 AS c_or3kcz,
            floor(ref_0.c_f7nvvq) AS c_pfnd1iaw,
            floor(4373163444658715090) AS c_j59,
            ref_0.c_u37 AS c_f_2008,
            ref_0.c_h16pd AS c_y2_2009,
            ref_0.c_j3 AS c_q9e4c4y15
        FROM remote('127.0.0.1', currentDatabase(), test_if_type_mismatch) AS ref_0
        WHERE (CAST((ref_0.c_u37 > ref_0.c_d9n_3) AS Nullable(Bool)))
    ) AS subq_0
WHERE (CAST((negate(multiIf((CAST((subq_0.c_j59 = subq_0.c_pfnd1iaw) AS Nullable(Bool))), 0, subq_0.c_pfnd1iaw)) = multiIf((CAST((round(subq_0.c_or3kcz) < subq_0.c_j59) AS Nullable(Bool))), subq_0.c_j59, subq_0.c_pfnd1iaw)) AS Nullable(Bool)));

SELECT
    if(1, floor(4373163444658715090), toInt32(0)) AS when_true,
    if(0, floor(4373163444658715090), toInt32(42)) AS when_false;