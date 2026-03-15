-- Tags: no-tsan, no-asan, no-msan, no-fasttest
-- Test is slow
create table tab (x DateTime('UTC'), y UInt32, v Int32) engine = ReplacingMergeTree(v) order by x;
