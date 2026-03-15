CREATE TABLE test_00209
(
    x UInt8
)
ENGINE = Log;

SET enable_positional_arguments = 0;

SELECT
    count(),
    min(x),
    max(x)
FROM test_00209;