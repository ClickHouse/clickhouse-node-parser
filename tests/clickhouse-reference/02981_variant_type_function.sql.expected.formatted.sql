SELECT variantType(v) AS type
FROM test;

SELECT toTypeName(variantType(v))
FROM test
LIMIT 1;

SELECT variantType()
FROM test;

SELECT variantType(v, v)
FROM test;

SELECT variantType(v.String)
FROM test;

SELECT variantType(v::Variant(UInt64, String, Array(UInt64), Date)) AS type
FROM test;

SELECT toTypeName(variantType(v::Variant(UInt64, String, Array(UInt64), Date)))
FROM test
LIMIT 1;