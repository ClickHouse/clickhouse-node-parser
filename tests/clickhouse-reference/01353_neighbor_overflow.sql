SELECT neighbor(toString(number), -9223372036854775808) FROM numbers(100); -- { serverError ARGUMENT_OUT_OF_BOUND }
