set allow_suspicious_low_cardinality_types = 0;
set allow_suspicious_fixed_string_types = 0;
drop table if exists test;
create table test (id UInt64) engine=MergeTree order by id;
drop table test;
