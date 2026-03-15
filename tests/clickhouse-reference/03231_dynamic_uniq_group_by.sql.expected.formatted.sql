SET allow_experimental_dynamic_type = 1;

SET allow_suspicious_types_in_group_by = 1;

SET allow_suspicious_types_in_order_by = 1;

CREATE TABLE test
(
    d Dynamic(max_types=2)
)
ENGINE = Memory;

SELECT uniqExact(d)
FROM test;

SELECT
    count(),
    d
FROM test
GROUP BY d
ORDER BY d ASC;