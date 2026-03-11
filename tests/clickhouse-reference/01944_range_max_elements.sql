SELECT range(number % 3) FROM numbers(10);
SELECT range(number % 3) FROM numbers(11);
SELECT range(number % 3) FROM numbers(12); -- { serverError ARGUMENT_OUT_OF_BOUND }
