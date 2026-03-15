set enable_dynamic_type = 1;
create table test (d Dynamic) engine=MergeTree order by tuple() settings min_bytes_for_wide_part=1, min_rows_for_wide_part=1;
