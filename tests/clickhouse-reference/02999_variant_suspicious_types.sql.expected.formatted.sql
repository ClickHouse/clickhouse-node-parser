SELECT 42::Variant(UInt32, Int64); -- {serverError ILLEGAL_COLUMN}

SELECT [42]::Variant(Array(UInt32), Array(Int64)); -- {serverError ILLEGAL_COLUMN}

SELECT 'Hello'::Variant(String, LowCardinality(String)); -- {serverError ILLEGAL_COLUMN}

SELECT (1, 'Hello')::Variant(Tuple(UInt32, String), Tuple(Int64, String)); -- {serverError ILLEGAL_COLUMN}

SELECT map(42, 42)::Variant(Map(UInt64, UInt32), Map(UInt64, Int64)); -- {serverError ILLEGAL_COLUMN}