SELECT maxArgMax(agg_time, value)
FROM combinator_argMin_table_r1__fuzz_791
GROUP BY id
WITH CUBE
WITH TOTALS
FORMAT Null;