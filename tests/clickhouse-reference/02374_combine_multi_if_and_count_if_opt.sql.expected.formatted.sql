CREATE TABLE m
(
    a int
)
ENGINE = Log;

SET enable_analyzer = true, optimize_rewrite_sum_if_to_count_if = 1;