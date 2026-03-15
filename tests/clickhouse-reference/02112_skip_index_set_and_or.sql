create table set_index (a Int32, b Int32, INDEX b_set b type set(0) granularity 1) engine MergeTree order by tuple();
select b from set_index where a = 1 and a = 1 and b = 1 settings force_data_skipping_indices = 'b_set', optimize_move_to_prewhere=0;
