create table test_uint64 (`data` UInt64 Default 0) engine = MergeTree order by tuple();
create table test_float64 (`data` Float64 Default 0.0) engine = MergeTree order by tuple();
create table test_date (`data` Date) engine = MergeTree order by tuple();
create table test_datetime (`data` DateTime) engine = MergeTree order by tuple();
