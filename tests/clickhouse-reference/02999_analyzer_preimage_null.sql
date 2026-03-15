SET enable_analyzer=1;
SET optimize_time_filter_with_preimage=1;
CREATE TABLE date_t__fuzz_0 (`id` UInt32, `value1` String, `date1` Date) ENGINE = ReplacingMergeTree ORDER BY id SETTINGS allow_nullable_key=1;
