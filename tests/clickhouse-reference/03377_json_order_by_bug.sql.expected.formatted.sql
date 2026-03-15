SET enable_variant_type = 1, allow_suspicious_variant_types = 1, enable_json_type = 1, allow_suspicious_types_in_order_by = 1, type_json_skip_duplicated_paths = 1;

CREATE TABLE t0
(
    c0 Variant(Float32,UInt8,JSON)
)
ENGINE = Memory;

SELECT 1
FROM t0
ORDER BY t0.c0 DESC
FORMAT Null;