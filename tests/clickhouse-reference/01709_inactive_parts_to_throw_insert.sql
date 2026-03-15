create table data_01709 (i int) engine MergeTree order by i settings old_parts_lifetime = 10000000000, min_bytes_for_wide_part = 0, inactive_parts_to_throw_insert = 1;
