select count(), dynamicType(d) from test group by dynamicType(d) order by count(), dynamicType(d);
select x, y, d, d.String, d.UInt64, d.`Tuple(a UInt64)`.a from test order by x;
select x, y, d, d.String, d.UInt64, d.Date, d.`Tuple(a UInt64)`.a from test order by x;
select count(), dynamicType(d1) from test group by dynamicType(d1) order by count(), dynamicType(d1);
select x, y, d1, d1.String, d1.UInt64, d1.Date, d1.`Tuple(a UInt64)`.a from test order by x;
select x, y, d1, d1.String, d1.UInt64, d1.Date, d1.`Tuple(a UInt64)`.a, d1.`Array(Dynamic)`.UInt64, d1.`Array(Dynamic)`.String, d1.`Array(Dynamic)`.Date from test order by x;
select count(), dynamicType(d2) from test group by dynamicType(d2) order by count(), dynamicType(d2);
select x, y, d2, d2.String, d2.UInt64, d2.Date, d2.`Tuple(a UInt64)`.a, d2.`Array(Dynamic)`.UInt64, d2.`Array(Dynamic)`.String, d2.`Array(Dynamic)`.Date, from test order by x;
