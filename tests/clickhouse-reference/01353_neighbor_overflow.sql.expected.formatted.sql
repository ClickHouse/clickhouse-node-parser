SET allow_deprecated_error_prone_window_functions = 1;

SELECT neighbor(toString(number), -9223372036854775808)
FROM numbers(100); -- { serverError ARGUMENT_OUT_OF_BOUND }