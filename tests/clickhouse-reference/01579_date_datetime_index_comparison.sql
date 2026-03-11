select 1 from test_index where date < toDateTime('2020-10-30 06:00:00');
select toTypeName([-1, toUInt32(1)]);
-- We don't promote to wide integers
select toTypeName([-1, toUInt64(1)]); -- { serverError NO_COMMON_TYPE }
select toTypeName([-1, toInt128(1)]);
select toTypeName([toInt64(-1), toInt128(1)]);
select toTypeName([toUInt64(1), toUInt256(1)]);
