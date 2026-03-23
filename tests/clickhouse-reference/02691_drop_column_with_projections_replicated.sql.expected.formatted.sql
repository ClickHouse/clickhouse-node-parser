DROP TABLE IF EXISTS `02691_drop_column_replicated`;

CREATE TABLE `02691_drop_column_replicated`
(
    col1 Int64,
    col2 Int64,
    PROJECTION `02691_drop_column_replicated` (    SELECT *
    ORDER BY col1 ASC)
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/02691_drop_column', 'r1')
ORDER BY col1;

INSERT INTO `02691_drop_column_replicated`;

DROP TABLE `02691_drop_column_replicated`;