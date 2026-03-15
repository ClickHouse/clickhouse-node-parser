SET allow_experimental_dynamic_type = 1;
SET allow_suspicious_types_in_order_by = 1;
SET optimize_read_in_order = 1;
CREATE TABLE to_table
(
    n1 UInt8,
    n2 Dynamic(max_types=2)
)
ENGINE = MergeTree ORDER BY n1;
SELECT *, dynamicType(n2), isDynamicElementInSharedData(n2) FROM to_table ORDER BY ALL;
