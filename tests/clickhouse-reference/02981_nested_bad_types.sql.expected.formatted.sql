SELECT [42]::Array(LowCardinality(UInt64)); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT [[[42]]]::Array(Array(Array(LowCardinality(UInt64)))); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT map('a', 42)::Map(String, LowCardinality(UInt64)); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT map('a', map('b', [42]))::Map(String, Map(String, Array(LowCardinality(UInt64)))); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT tuple('a', 42)::Tuple(String, LowCardinality(UInt64)); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT tuple('a', [map('b', 42)])::Tuple(String, Array(Map(String, LowCardinality(UInt64)))); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT ['42']::Array(FixedString(1000000)); -- {serverError ILLEGAL_COLUMN}

SELECT [[['42']]]::Array(Array(Array(FixedString(1000000)))); -- {serverError ILLEGAL_COLUMN}

SELECT map('a', '42')::Map(String, FixedString(1000000)); -- {serverError ILLEGAL_COLUMN}

SELECT map('a', map('b', ['42']))::Map(String, Map(String, Array(FixedString(1000000)))); -- {serverError ILLEGAL_COLUMN}

SELECT tuple('a', '42')::Tuple(String, FixedString(1000000)); -- {serverError ILLEGAL_COLUMN}

SELECT tuple('a', [map('b', '42')])::Tuple(String, Array(Map(String, FixedString(1000000)))); -- {serverError ILLEGAL_COLUMN}

SELECT 42::Variant(String, LowCardinality(UInt64))
SETTINGS allow_experimental_variant_type = 1; -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT tuple('a', [map('b', 42)])::Tuple(String, Array(Map(String, Variant(LowCardinality(UInt64), String)))); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT '42'::Variant(UInt64, FixedString(1000000)); -- {serverError ILLEGAL_COLUMN}

SELECT tuple('a', [map('b', '42')])::Tuple(String, Array(Map(String, Variant(UInt32, FixedString(1000000))))); -- {serverError ILLEGAL_COLUMN}