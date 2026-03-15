SET allow_experimental_variant_type = 1;

CREATE TABLE test
(
    x UInt64,
    d Variant(UInt64)
)
ENGINE = Memory;

SELECT d
FROM test
ORDER BY d::String ASC
LIMIT 32213
FORMAT Null;