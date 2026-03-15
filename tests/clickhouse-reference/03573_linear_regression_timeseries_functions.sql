CREATE TABLE ts_raw_data(timestamp DateTime64(3,'UTC'), value Float64) ENGINE = MergeTree() ORDER BY timestamp;
SELECT groupArraySorted(20)((timestamp::Decimal(20,3), value)) FROM ts_raw_data;
SET allow_experimental_ts_to_grid_aggregate_function = 1;
