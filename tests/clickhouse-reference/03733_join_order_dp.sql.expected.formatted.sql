SELECT sum(sipHash64(T1.A_Description, T2.B_Data, T3.C_Value, T4.D_LookupCode))
FROM
    R1 AS T1
CROSS JOIN R2 AS T2
CROSS JOIN R3 AS T3
CROSS JOIN R4 AS T4
WHERE T1.A_ID = T2.R1_A_ID
    AND T1.A_ID = T3.R1_A_ID
    AND T3.R4_D_ID = T4.D_ID
    AND T1.A_Description = 'Type H'
    AND T4.D_LookupCode = 'Lookup S'
SETTINGS query_plan_optimize_join_order_algorithm = 'greedy';

SELECT sum(sipHash64(T1.A_Description, T2.B_Data, T3.C_Value, T4.D_LookupCode))
FROM
    R1 AS T1
CROSS JOIN R2 AS T2
CROSS JOIN R3 AS T3
CROSS JOIN R4 AS T4
WHERE T1.A_ID = T2.R1_A_ID
    AND T1.A_ID = T3.R1_A_ID
    AND T3.R4_D_ID = T4.D_ID
    AND T1.A_Description = 'Type H'
    AND T4.D_LookupCode = 'Lookup S'
SETTINGS query_plan_optimize_join_order_algorithm = 'dpsize';

SELECT 1
FROM
    (
        SELECT 1 AS c0
    ) AS t0
LEFT JOIN (
        SELECT 1 AS c0
    ) AS t1
    ON t0.c0 = t1.c0
SETTINGS
    query_plan_optimize_join_order_algorithm = 'dpsize',
    enable_parallel_replicas = 0;

SELECT 1
FROM
    (
        SELECT 1 AS c0
    ) AS t0
LEFT JOIN (
        SELECT 1 AS c0
    ) AS t1
    ON t0.c0 = t1.c0
SETTINGS
    query_plan_optimize_join_order_algorithm = 'dpsize,greedy',
    enable_parallel_replicas = 0;