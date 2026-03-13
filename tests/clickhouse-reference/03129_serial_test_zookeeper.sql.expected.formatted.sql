-- Tags: zookeeper
SELECT generateSerialID(concat(currentDatabase(), 'x'));

SELECT generateSerialID(concat(currentDatabase(), 'y'));

SELECT generateSerialID(concat(currentDatabase(), 'x'))
FROM numbers(5);

-- Test basic functionality with start_value parameter
SELECT generateSerialID(concat(currentDatabase(), 'start100'), 100);

-- Test with different start values for different series
SELECT generateSerialID(concat(currentDatabase(), 'start200'), 200);

-- Test with start value 0 (should behave same as no parameter)
SELECT generateSerialID(concat(currentDatabase(), 'start0'), 0);

-- Test with multiple rows and start_value
SELECT generateSerialID(concat(currentDatabase(), 'start500'), 500)
FROM numbers(5);

-- Test that start_value only affects the first call (when series is created)
-- Subsequent calls should ignore the start_value parameter
SELECT generateSerialID(concat(currentDatabase(), 'start1000'), 1000);

SELECT generateSerialID(concat(currentDatabase(), 'start1000'), 9999); -- This should return 1001, not 9999

-- Test error cases
SELECT generateSerialID(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT generateSerialID('x', 'y'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT generateSerialID('x', 'y', 'z'); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT generateSerialID(1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT generateSerialID('abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij'); -- { serverError BAD_ARGUMENTS }

-- Here the functions are identical and fall into common-subexpression-elimination:
SELECT
    generateSerialID(concat(currentDatabase(), 'z')),
    generateSerialID(concat(currentDatabase(), 'z'))
FROM numbers(5);

SELECT generateSerialID('a'); -- { serverError LIMIT_EXCEEDED }