create table test (a UInt32, d Dynamic, ad Array(Dynamic), td Tuple(Dynamic), md Map(String, Dynamic), j JSON, x UInt32, y UInt32, z UInt32) engine=Memory;
select x, y, z, argMax(d, a), argMax(ad, a), argMax(td, a), argMax(md, a), argMax(j, a), max(a), argMin(d, a), argMin(ad, a), argMin(td, a), argMin(md, a), argMin(j, a), min(a) from test group by x, y, z order by x, y, z;
