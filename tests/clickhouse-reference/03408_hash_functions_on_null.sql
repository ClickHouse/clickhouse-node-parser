

select xxHash32(null);
select xxHash64(null);
select xxHash64([]);
select xxHash64([null]);
select xxHash64([null, null]);
select xxHash64([null::Nullable(Int64)]);
select xxHash64([null::Nullable(String)]);
select xxHash64(tuple());
select xxHash64(tuple(null));
select xxHash64(tuple(null, null));
select xxHash64(tuple(null::Nullable(Int64)));
select xxHash64(tuple(null::Nullable(String)));
select xxHash32(materialize(null));
select xxHash64(materialize(null));
select xxHash64(materialize([]));
select xxHash64(materialize([null]));
select xxHash64(materialize([null, null]));
select xxHash64(materialize([null::Nullable(Int64)]));
select xxHash64(materialize([null::Nullable(String)]));
select xxHash64(materialize(tuple()));
select xxHash64(materialize(tuple(null)));
select xxHash64(materialize(tuple(null, null)));
select xxHash64(materialize(tuple(null::Nullable(Int64))));
select xxHash64(materialize(tuple(null::Nullable(String))));
select xxHash32(a) from test_hash_on_null;
select cityHash64([1]);
select cityHash64([toNullable(1)]);
select cityHash64('hi');
select cityHash64(tuple('hi'));
select cityHash64(tuple(toNullable('hi')));
select cityHash64(tuple(toLowCardinality(toNullable('hi'))));
select cityHash64(materialize(tuple(toLowCardinality(toNullable('hi')))));
select a, xxHash32(a), xxHash32(tuple(a)) from test_mix_null;
select reinterpret(sipHash128(tuple(*)), 'UInt128') from t;
select cityHash64(tuple(*)) from t;
select cityHash64(*) from t;
select cityHash64(a.x) from t;
select cityHash64(a.y) from t;
select cityHash64(a.z) from t;
--- Keyed.
select sipHash64Keyed(materialize((1::UInt64, 2::UInt64)), null) from numbers(2);
select sipHash64Keyed((1::UInt64, 2::UInt64), tuple(null)) from numbers(2);
select sipHash64Keyed(materialize((1::UInt64, 2::UInt64)), tuple(null)) from numbers(2);
select sipHash64Keyed((1::UInt64, number), tuple(null)) from numbers(3);
-- Make sure all types are allowed.
select sum(ignore(cityHash64(tuple(*)))) from (select * from generateRandom() limit 100);
