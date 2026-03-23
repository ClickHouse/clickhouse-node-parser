DROP TABLE IF EXISTS t_modify_from_lc_1;
DROP TABLE IF EXISTS t_modify_from_lc_2;
SET allow_suspicious_low_cardinality_types = 1;
CREATE TABLE t_modify_from_lc_1
(
    id UInt64,
    a LowCardinality(UInt32) CODEC(NONE)
)
ENGINE = MergeTree ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';
CREATE TABLE t_modify_from_lc_2
(
    id UInt64,
    a LowCardinality(UInt32) CODEC(NONE)
)
ENGINE = MergeTree ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';
INSERT INTO t_modify_from_lc_1 SELECT number, number FROM numbers(100000);
INSERT INTO t_modify_from_lc_2 SELECT number, number FROM numbers(100000);
