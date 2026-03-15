create table tab (x UInt64, v UInt64) engine = ReplacingMergeTree(v) order by (x, sipHash64(x)) sample by sipHash64(x);
select * from tab final sample 1/2 order by x limit 5;
select sipHash64(x) from tab sample 1/2 order by x, sipHash64(x) limit 5;
