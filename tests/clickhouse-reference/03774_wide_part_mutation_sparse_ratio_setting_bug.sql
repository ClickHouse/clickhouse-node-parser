create table test (a UInt32, b UInt32) engine=MergeTree order by tuple() settings min_bytes_for_wide_part=0, ratio_of_defaults_for_sparse_serialization=0.0, max_suspicious_broken_parts=0, max_suspicious_broken_parts_bytes=0;
select * from test;
