SET allow_experimental_analyzer = 1;
SET query_plan_optimize_join_order_limit = 10;
SET use_statistics = 1;
SET query_plan_join_swap_table='auto';
SET enable_join_runtime_filters = 0;
-- R1: Small dimension table (Demo size: 10)
CREATE TABLE R1 (
    A_ID UInt32,
    A_Description String
) ENGINE = MergeTree()
PRIMARY KEY (A_ID)
SETTINGS auto_statistics_types = 'uniq';
-- R2: Large fact table (Demo size: 1,000)
-- Joins only with R1.
CREATE TABLE R2 (
    B_ID UInt32,
    R1_A_ID UInt32,
    B_Data Float64
) ENGINE = MergeTree()
PRIMARY KEY (B_ID)
SETTINGS auto_statistics_types = 'uniq';
-- R3: Another large fact table (Demo size: 1,000)
-- Joins with R1 and R4.
CREATE TABLE R3 (
    C_ID UInt32,
    R1_A_ID UInt32,
    R4_D_ID UInt32,
    C_Value Int32
) ENGINE = MergeTree()
PRIMARY KEY (C_ID)
SETTINGS auto_statistics_types = 'uniq';
-- R4: Small lookup table (Demo size: 10)
-- Joins only with R3.
CREATE TABLE R4 (
    D_ID UInt32,
    D_LookupCode String
) ENGINE = MergeTree()
PRIMARY KEY (D_ID)
SETTINGS auto_statistics_types = 'uniq';
SELECT sum(sipHash64(
    T1.A_Description,
    T2.B_Data,
    T3.C_Value,
    T4.D_LookupCode))
FROM R1 AS T1, R2 AS T2, R3 AS T3, R4 AS T4
WHERE
    T1.A_ID = T2.R1_A_ID
    AND T1.A_ID = T3.R1_A_ID
    AND T3.R4_D_ID = T4.D_ID
    AND T1.A_Description = 'Type H'
    AND T4.D_LookupCode = 'Lookup S'
SETTINGS query_plan_optimize_join_order_algorithm = 'greedy';
SELECT sum(sipHash64(
    T1.A_Description,
    T2.B_Data,
    T3.C_Value,
    T4.D_LookupCode))
FROM R1 AS T1, R2 AS T2, R3 AS T3, R4 AS T4
WHERE
    T1.A_ID = T2.R1_A_ID
    AND T1.A_ID = T3.R1_A_ID
    AND T3.R4_D_ID = T4.D_ID
    AND T1.A_Description = 'Type H'
    AND T4.D_LookupCode = 'Lookup S'
SETTINGS query_plan_optimize_join_order_algorithm = 'dpsize';
SELECT 1 FROM (SELECT 1 c0) t0 LEFT JOIN (SELECT 1 c0) t1 ON t0.c0 = t1.c0
SETTINGS query_plan_optimize_join_order_algorithm = 'dpsize', enable_parallel_replicas=0; --{serverError EXPERIMENTAL_FEATURE_ERROR}
SELECT 1 FROM (SELECT 1 c0) t0 LEFT JOIN (SELECT 1 c0) t1 ON t0.c0 = t1.c0
SETTINGS query_plan_optimize_join_order_algorithm = 'dpsize,greedy', enable_parallel_replicas=0;
