set allow_experimental_dynamic_type = 1;
set allow_experimental_variant_type = 1;
set use_variant_as_common_type = 1;
create table test (x UInt64, y UInt64) engine=MergeTree order by x settings min_rows_for_wide_part=1, min_bytes_for_wide_part=1;
select count(), dynamicType(d) from test group by dynamicType(d) order by count(), dynamicType(d);
select x, y, d, d.String, d.UInt64, d.`Tuple(a UInt64)`.a from test order by x;
select x, y, d, d.String, d.UInt64, d.Date, d.`Tuple(a UInt64)`.a from test order by x;
select x, y, y.UInt64, y.String, y.`Tuple(a UInt64)`.a, d.String, d.UInt64, d.Date, d.`Tuple(a UInt64)`.a from test order by x;
