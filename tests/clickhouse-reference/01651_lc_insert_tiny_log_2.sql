set allow_suspicious_low_cardinality_types = 1, max_rows_to_read = '31M';
CREATE TABLE perf_lc_num(        num UInt8,        arr Array(LowCardinality(Int64)) default [num]        ) ENGINE = Log;
select sum(length(arr)) from perf_lc_num;
select sum(length(arr)), sum(num) from perf_lc_num;
