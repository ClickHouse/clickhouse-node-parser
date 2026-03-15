SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE test
(
    x LowCardinality(Nullable(UInt32)),
    y String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE m_table
(
    x UInt32,
    y String
)
ENGINE = Merge(currentDatabase(), 'test*');

SELECT
    toTypeName(x),
    x
FROM m_table
SETTINGS
    additional_table_filters = map('m_table', 'x != 4'),
    optimize_move_to_prewhere = 1,
    enable_analyzer = 1;