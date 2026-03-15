SET allow_experimental_dynamic_type = 1;

SET allow_experimental_variant_type = 1;

SET allow_suspicious_types_in_order_by = 1;

CREATE TABLE test_variable
(
    v Variant(String, UInt32, IPv6, Bool, DateTime64)
)
ENGINE = Memory;

CREATE TABLE test_dynamic
(
    d Dynamic
)
ENGINE = Memory;

SELECT
    v,
    toTypeName(v)
FROM test_variable
ORDER BY v ASC;

SELECT
    d,
    dynamicType(d)
FROM test_dynamic
ORDER BY d ASC;