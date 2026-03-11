SELECT *
FROM numbers(100000000)
SETTINGS
    max_block_size = 1,
    max_execution_time = 2,
    timeout_overflow_mode = 'break'
FORMAT Null;

SELECT *
FROM numbers(100000000)
SETTINGS
    max_block_size = 1,
    timeout_before_checking_execution_speed = 1,
    max_estimated_execution_time = 2,
    timeout_overflow_mode = 'throw'
FORMAT Null;

SELECT *
FROM numbers(100000000)
SETTINGS
    max_block_size = 1,
    timeout_before_checking_execution_speed = 1,
    max_execution_time = 2,
    timeout_overflow_mode = 'throw'
FORMAT Null;