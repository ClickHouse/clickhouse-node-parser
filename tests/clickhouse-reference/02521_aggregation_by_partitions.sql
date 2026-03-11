-- { echoOff }

select count() from (select throwIf(count() != 2) from t1 group by a);
-- { echoOff }

select count() from (select throwIf(count() != 2) from t2 group by a);
-- { echoOff }

select count() from (select throwIf(count() != 2) from t3 group by a);
select throwIf(count() != 4) from remote('127.0.0.{1,2}', currentDatabase(), t3) group by a format Null;
-- if we happened to switch to external aggregation at some point, merging will happen as usual
select count() from (select throwIf(count() != 2) from t3 group by a) settings max_bytes_before_external_group_by = '1Ki', max_bytes_ratio_before_external_group_by = 0;
-- { echoOff }

select count() from (select throwIf(count() != 2) from t4 group by a);
-- { echoOff }

select count() from (select throwIf(count() != 2) from t5 group by a);
-- { echoOff }

select count() from (select throwIf(count() != 2) from t6 group by a);
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select intDiv(a, 2) as a1 from t7 group by a1
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select intDiv(a, 2) + 1 as a1 from t8 group by a1
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select intDiv(a, 3) as a1 from t9 group by a1
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select intDiv(a, 2) + 1 as a1, intDiv(b, 3) as b1 from t10 group by a1, b1, pi()
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select intDiv(a, 2) + 1 as a1, intDiv(b, 3) * 2 as b1 from t11 group by a1, b1, pi()
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a, b from t12 group by a, b, pi()
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select s from t13 group by intDiv(a, 2) + intDiv(b, 3) as s, pi()
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select intDiv(a, 2) as a1, intDiv(b, 3) as b1 from t14 group by a1, b1, pi()
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a from t15 group by a
) where explain like '%Skip merging: %'
settings force_aggregate_partitions_independently = 0;
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a from t16 group by a
) where explain like '%Skip merging: %'
settings force_aggregate_partitions_independently = 0, max_number_of_partitions_for_independent_aggregation = 4;
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a from t17 group by a
) where explain like '%Skip merging: %'
settings force_aggregate_partitions_independently = 0, max_threads = 4;
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a1 from t18 group by intDiv(a, 2) as a1
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a1 from t19 group by blockNumber() as a1
) where explain like '%Skip merging: %';
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a1 from t20 group by rand(a) as a1
) where explain like '%Skip merging: %';
select a from t21 group by a limit 10 format Null;
select replaceRegexpOne(explain, '^[ ]*(.*)', '\\1') from (
    explain actions=1 select a from t22 final group by a
) where explain like '%Skip merging: %';
