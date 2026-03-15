create table m (a int) engine Log;
set enable_analyzer = true, optimize_rewrite_sum_if_to_count_if=1;
