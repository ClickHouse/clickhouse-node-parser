SELECT count() = 1
FROM null_in__fuzz_6
PREWHERE 71
WHERE i IN (test_set); -- { serverError CANNOT_CONVERT_TYPE }