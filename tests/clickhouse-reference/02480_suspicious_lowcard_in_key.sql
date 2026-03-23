set allow_suspicious_low_cardinality_types=1;
create table test (val LowCardinality(Float32)) engine MergeTree order by val;
insert into test values (nan);
select count() from test where toUInt64(val) = -1; -- { serverError CANNOT_CONVERT_TYPE }
