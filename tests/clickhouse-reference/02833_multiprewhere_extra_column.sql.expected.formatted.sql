CREATE TABLE t_multi_prewhere
(
    a UInt64,
    b UInt64,
    c UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, add_minmax_index_for_numeric_columns = 0;

CREATE ROW POLICY policy_02834 ON t_multi_prewhere USING a > 2000 AS permissive TO ALL;

SELECT sum(b)
FROM t_multi_prewhere
PREWHERE a < 5000;

SELECT ProfileEvents['FileOpen']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND ilike(query, '%select sum(b) from t_multi_prewhere prewhere a < 5000%');