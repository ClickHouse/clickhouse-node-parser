-- Tags: no-fasttest
SET allow_suspicious_low_cardinality_types = 0;

SELECT CAST(1000000, 'LowCardinality(UInt64)'); -- {serverError SUSPICIOUS_TYPE_FOR_LOW_CARDINALITY}

SET allow_suspicious_fixed_string_types = 0;

SELECT CAST('', 'FixedString(1000)'); -- {serverError ILLEGAL_COLUMN}