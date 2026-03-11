SELECT toTypeName(rand(CAST(4 AS Nullable(UInt8))));

SELECT toTypeName(randCanonical(CAST(4 AS Nullable(UInt8))));

SELECT toTypeName(randConstant(CAST(4 AS Nullable(UInt8))));

SELECT toTypeName(rand(NULL));

SELECT toTypeName(randCanonical(NULL));

SELECT toTypeName(randConstant(NULL));

SELECT rand(CAST(4 AS Nullable(UInt8))) * 0;

SELECT randCanonical(CAST(4 AS Nullable(UInt8))) * 0;

SELECT randConstant(CAST(4 AS Nullable(UInt8))) * 0;

SELECT rand(NULL) * 0;

SELECT randCanonical(NULL) * 0;

SELECT randConstant(NULL) * 0;