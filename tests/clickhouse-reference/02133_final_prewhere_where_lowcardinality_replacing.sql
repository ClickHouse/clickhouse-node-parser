CREATE TABLE errors_local (level LowCardinality(String)) ENGINE=ReplacingMergeTree ORDER BY level settings min_bytes_for_wide_part = '10000000';
SELECT toTypeName(level) FROM errors_local FINAL PREWHERE isNotNull(level) WHERE isNotNull(level) LIMIT 1;
CREATE TABLE errors_local(level LowCardinality(String)) ENGINE=ReplacingMergeTree ORDER BY level;
