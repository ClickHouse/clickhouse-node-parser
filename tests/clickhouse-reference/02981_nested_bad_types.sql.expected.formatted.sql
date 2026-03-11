SELECT [42]::Array(LowCardinality(UInt64));

SELECT [[[42]]]::Array(Array(Array(LowCardinality(UInt64))));

SELECT map('a', 42)::Map(String, LowCardinality(UInt64));

SELECT map('a', map('b', [42]))::Map(String, Map(String, Array(LowCardinality(UInt64))));

SELECT tuple('a', 42)::Tuple(String, LowCardinality(UInt64));

SELECT tuple('a', [map('b', 42)])::Tuple(String, Array(Map(String, LowCardinality(UInt64))));

SELECT ['42']::Array(FixedString(1000000));

SELECT [[['42']]]::Array(Array(Array(FixedString(1000000))));

SELECT map('a', '42')::Map(String, FixedString(1000000));

SELECT map('a', map('b', ['42']))::Map(String, Map(String, Array(FixedString(1000000))));

SELECT tuple('a', '42')::Tuple(String, FixedString(1000000));

SELECT tuple('a', [map('b', '42')])::Tuple(String, Array(Map(String, FixedString(1000000))));

SELECT 42::Variant(String, LowCardinality(UInt64))
SETTINGS allow_experimental_variant_type = 1;

SELECT tuple('a', [map('b', 42)])::Tuple(String, Array(Map(String, Variant(LowCardinality(UInt64), String))));

SELECT '42'::Variant(UInt64, FixedString(1000000));

SELECT tuple('a', [map('b', '42')])::Tuple(String, Array(Map(String, Variant(UInt32, FixedString(1000000)))));