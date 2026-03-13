SELECT CAST(1000000, 'LowCardinality(UInt64)'); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SELECT CAST('', 'FixedString(1000)'); -- {serverError ILLEGAL_COLUMN}