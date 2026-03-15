create table t(s LowCardinality(String)) Engine = MergeTree order by tuple() settings min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0;
