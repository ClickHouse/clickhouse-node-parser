create table test (ad Array(Array(Dynamic)), jd Array(Array(JSON))) engine=MergeTree order by tuple();
select ad.`Array(UInt64)`.size2, jd.a.:`Array(Nullable(Int64))`.size2, jd.b[].c.:`Array(Array(Nullable(Int64)))`.size3, jd.b[].c.:`Array(Array(Nullable(Int64)))`.size4 from test;
select ad.`Array(UInt64)`.size0, jd.a.:`Array(Nullable(Int64))`.size0, jd.b[].c.:`Array(Array(Nullable(Int64)))`.size0, jd.b[].c.:`Array(Array(Nullable(Int64)))`.size1 from test; -- {serverError UNKNOWN_IDENTIFIER}
