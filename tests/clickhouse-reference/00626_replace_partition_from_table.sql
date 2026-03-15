CREATE TABLE src (p UInt64, k String, d UInt64) ENGINE = MergeTree PARTITION BY p ORDER BY k;
CREATE TABLE dst (p UInt64, k String, d UInt64) ENGINE = MergeTree PARTITION BY p ORDER BY k SETTINGS merge_selector_base=1000;
SELECT count(), sum(d) FROM src;
SELECT count(), sum(d) FROM dst;
CREATE TEMPORARY table test_block_numbers (m UInt64);
SELECT (max(m) - min(m) > 1) AS new_block_is_generated FROM test_block_numbers;
SELECT count(), sum(d), uniqExact(_part) FROM dst;
SET optimize_throw_if_noop=1;
