SELECT
    't'::Variant(String, Bool) AS v,
    variantType(v);

SELECT
    'on'::Variant(String, Bool) AS v,
    variantType(v);

SELECT
    'f'::Variant(String, Bool) AS v,
    variantType(v);

SELECT
    'off'::Variant(String, Bool) AS v,
    variantType(v);

SELECT
    'true'::Variant(String, Bool) AS v,
    variantType(v);

SELECT
    'false'::Variant(String, Bool) AS v,
    variantType(v);