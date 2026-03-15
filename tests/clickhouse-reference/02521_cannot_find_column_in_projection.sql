create table test(day Date, id UInt32) engine=MergeTree partition by day order by tuple();
