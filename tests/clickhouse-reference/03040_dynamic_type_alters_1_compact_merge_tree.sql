select count(), dynamicType(d), isDynamicElementInSharedData(d) from test group by dynamicType(d), isDynamicElementInSharedData(d) order by count(), dynamicType(d);
select x, y, d, d.String, d.UInt64, d.`Tuple(a UInt64)`.a from test order by x;
select x, y, d, d.String, d.UInt64, d.Date, d.`Tuple(a UInt64)`.a from test order by x;
select x, y, y.UInt64, y.String, y.`Tuple(a UInt64)`.a, d.String, d.UInt64, d.Date, d.`Tuple(a UInt64)`.a from test order by x;
