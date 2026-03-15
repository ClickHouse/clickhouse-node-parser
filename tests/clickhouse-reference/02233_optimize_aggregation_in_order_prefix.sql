-- Tags: no-object-storage

SET merge_tree_read_split_ranges_into_intersecting_and_non_intersecting_injection_probability = 0.0;
create table data_02233 (parent_key Int, child_key Int, value Int) engine=MergeTree() order by parent_key;
-- before inserting data, it may produce empty header
SELECT child_key, parent_key, child_key FROM data_02233 GROUP BY parent_key, child_key, child_key ORDER BY parent_key ASC NULLS LAST SETTINGS max_threads = 1, optimize_aggregation_in_order = 1;
SELECT child_key, parent_key, child_key FROM data_02233 GROUP BY parent_key, child_key, child_key WITH TOTALS ORDER BY parent_key ASC NULLS LAST SETTINGS max_threads = 1, optimize_aggregation_in_order = 1;
select parent_key, child_key, count() from data_02233 group by parent_key, child_key with totals order by parent_key, child_key settings max_threads=1, optimize_aggregation_in_order=1;
select parent_key, child_key, count() from data_02233 group by parent_key, child_key with totals order by parent_key, child_key settings max_threads=1, optimize_aggregation_in_order=1, max_block_size=1;
select parent_key, child_key, count() from data_02233 group by parent_key, child_key with totals order by parent_key, child_key settings max_threads=1, optimize_aggregation_in_order=0;
-- fuzzer
SELECT child_key, parent_key, child_key FROM data_02233 GROUP BY parent_key, child_key, child_key ORDER BY child_key, parent_key ASC NULLS LAST SETTINGS max_threads = 1, optimize_aggregation_in_order = 1;
SELECT child_key, parent_key, child_key FROM data_02233 GROUP BY parent_key, child_key, child_key WITH TOTALS ORDER BY child_key, parent_key ASC NULLS LAST SETTINGS max_threads = 1, optimize_aggregation_in_order = 1;
