SET parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

CREATE TABLE t
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a;

SELECT
    count(),
    min(a),
    max(a)
FROM t
SETTINGS additional_table_filters = map('t', '0');

CREATE TABLE atf_p
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count()
FROM atf_p
SETTINGS additional_table_filters = map('atf_p', 'x <= 2');