SET enable_time_time64_type = 1;
SET input_format_csv_use_default_on_bad_values = 1;
SET input_format_parallel_parsing = 1;
CREATE TABLE t0
(
    c0 Int,
    c1 Time,
    c2 Int128,
    c3 Int
) ENGINE = Memory;
