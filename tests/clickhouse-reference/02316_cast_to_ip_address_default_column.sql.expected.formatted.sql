SET cast_ipv4_ipv6_default_on_conversion_error = 1;

CREATE TABLE ipv4_test
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

SET cast_ipv4_ipv6_default_on_conversion_error = 0;

CREATE TABLE ipv6_test
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

SELECT *
FROM ipv6_test;