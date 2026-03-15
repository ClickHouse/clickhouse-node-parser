-- https://github.com/ClickHouse/ClickHouse/issues/39855
SET enable_analyzer=1;
create table x(
    a UInt64,
    `sipHash64(a)` UInt64
) engine = MergeTree order by a;
select a, sipHash64(a) from x order by sipHash64(a);
select a, sipHash64(a) from x order by `sipHash64(a)`;
