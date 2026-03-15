SET allow_experimental_dynamic_type = 1;

SET allow_suspicious_types_in_order_by = 1;

CREATE TABLE t1
(
    c0 Array(Dynamic)
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM t1
ORDER BY `ALL` ASC;