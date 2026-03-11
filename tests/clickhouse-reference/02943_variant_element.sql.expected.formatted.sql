SELECT variantElement(NULL::Variant(String, UInt64), 'UInt64')
FROM numbers(4);

SELECT variantElement(number::Variant(String, UInt64), 'UInt64')
FROM numbers(4);

SELECT variantElement(number::Variant(String, UInt64), 'String')
FROM numbers(4);

SELECT variantElement((if(number % 2, NULL, number))::Variant(String, UInt64), 'UInt64')
FROM numbers(4);

SELECT variantElement((if(number % 2, NULL, number))::Variant(String, UInt64), 'String')
FROM numbers(4);

SELECT variantElement((if(number % 2, NULL, concat('str_', toString(number))))::LowCardinality(Nullable(String))::Variant(LowCardinality(String), UInt64), 'LowCardinality(String)')
FROM numbers(4);

SELECT variantElement(NULL::LowCardinality(Nullable(String))::Variant(LowCardinality(String), UInt64), 'LowCardinality(String)')
FROM numbers(4);

SELECT variantElement((if(number % 2, NULL, number))::Variant(Array(UInt64), UInt64), 'Array(UInt64)')
FROM numbers(4);

SELECT variantElement(NULL::Variant(Array(UInt64), UInt64), 'Array(UInt64)')
FROM numbers(4);

SELECT variantElement(if(number % 2, NULL, range(number + 1)), 'Array(UInt64)')
FROM numbers(4);

SELECT variantElement([[(number % 2 ? NULL : number)::Variant(String, UInt64)]], 'UInt64')
FROM numbers(4);