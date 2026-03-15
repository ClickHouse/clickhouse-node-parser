create table test_enum (c Nullable(Enum16('A' = 1, 'B' = 2))) engine Log;
select * from test_enum;
select toString(c) from test_enum;
select toString('aaaa', NULL);
