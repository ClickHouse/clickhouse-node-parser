SELECT 42::Variant(UInt32, Int64);

SELECT [42]::Variant(Array(UInt32), Array(Int64));

SELECT 'Hello'::Variant(String, LowCardinality(String));

SELECT (1, 'Hello')::Variant(Tuple(UInt32, String), Tuple(Int64, String));

SELECT map(42, 42)::Variant(Map(UInt64, UInt32), Map(UInt64, Int64));