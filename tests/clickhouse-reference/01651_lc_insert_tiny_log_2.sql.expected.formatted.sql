SET allow_suspicious_low_cardinality_types = 1, max_rows_to_read = '31M';

CREATE TABLE perf_lc_num
(
    num UInt8,
    arr Array(LowCardinality(Int64)) DEFAULT [num]
)
ENGINE = Log;

SELECT sum(length(arr))
FROM perf_lc_num;

SELECT
    sum(length(arr)),
    sum(num)
FROM perf_lc_num;