-- Tags: long, no-tsan, no-msan, no-ubsan, no-asan

set allow_experimental_variant_type = 1;
set use_variant_as_common_type = 1;
set allow_experimental_dynamic_type = 1;
create table test (id UInt64, d Dynamic(max_types=2)) engine=Memory;
select distinct dynamicType(d) as type from test order by type;
select count() from test where dynamicType(d) == 'UInt64';
select count() from test where d.UInt64 is not NULL;
select count() from test where dynamicType(d) == 'String';
select count() from test where d.String is not NULL;
select count() from test where dynamicType(d) == 'Date';
select count() from test where d.Date is not NULL;
select count() from test where dynamicType(d) == 'LowCardinality(String)';
select count() from test where d.`LowCardinality(String)` is not NULL;
select count() from test where dynamicType(d) == 'Array(Variant(String, UInt64))';
select count() from test where not empty(d.`Array(Variant(String, UInt64))`);
select count() from test where dynamicType(d) == 'Array(Array(Dynamic))';
select count() from test where not empty(d.`Array(Array(Dynamic))`);
select count() from test where d is NULL;
select count() from test where not empty(d.`Tuple(a Array(Dynamic))`.a.String);
select d, d.UInt64, d.String, d.`Array(Variant(String, UInt64))` from test format Null;
select d.UInt64, d.String, d.`Array(Variant(String, UInt64))` from test format Null;
select d.Int8, d.Date, d.`Array(String)` from test format Null;
select d, d.UInt64, d.Date, d.`Array(Variant(String, UInt64))`, d.`Array(Variant(String, UInt64))`.size0, d.`Array(Variant(String, UInt64))`.UInt64 from test format Null;
select d.UInt64, d.Date, d.`Array(Variant(String, UInt64))`, d.`Array(Variant(String, UInt64))`.size0, d.`Array(Variant(String, UInt64))`.UInt64, d.`Array(Variant(String, UInt64))`.String from test format Null;
select d, d.`Tuple(a UInt64, b String)`.a, d.`Array(Dynamic)`.`Variant(String, UInt64)`.UInt64, d.`Array(Variant(String, UInt64))`.UInt64 from test format Null;
select d.`Array(Dynamic)`.`Variant(String, UInt64)`.UInt64, d.`Array(Dynamic)`.size0, d.`Array(Variant(String, UInt64))`.UInt64 from test format Null;
select d.`Array(Array(Dynamic))`.size1, d.`Array(Array(Dynamic))`.UInt64, d.`Array(Array(Dynamic))`.`Map(String, Tuple(a UInt64))`.values.a from test format Null;
