-- Tags: no-tsan, no-asan, no-msan, no-fasttest
-- Test is slow
create table tab (x DateTime('UTC'), y UInt32, v Int32) engine = ReplacingMergeTree(v) order by x;
insert into tab select toDateTime('2000-01-01', 'UTC') + number, number, 1 from numbers(1e7);
