SELECT
    CAST('42', 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST('abc', 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST('null', 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST('[1, 2, 3]', 'Variant(String, Array(UInt64))') AS v,
    variantType(v);

SELECT
    CAST('[1, 2, 3', 'Variant(String, Array(UInt64))') AS v,
    variantType(v);

SELECT
    CAST('42', 'Variant(Date)') AS v,
    variantType(v);

SELECT
    accurateCastOrNull('42', 'Variant(Date)') AS v,
    variantType(v);

SELECT
    CAST('42'::FixedString(2), 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST('42'::LowCardinality(String), 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST('42'::Nullable(String), 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST(NULL::Nullable(String), 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST('42'::LowCardinality(Nullable(String)), 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST(NULL::LowCardinality(Nullable(String)), 'Variant(String, UInt64)') AS v,
    variantType(v);

SELECT
    CAST(NULL::LowCardinality(Nullable(FixedString(2))), 'Variant(String, UInt64)') AS v,
    variantType(v);