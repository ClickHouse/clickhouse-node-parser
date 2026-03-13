SELECT number
FROM numbers(100e6)
ORDER BY number ASC
FORMAT Null
SETTINGS max_bytes_ratio_before_external_sort = -0.1; -- { serverError BAD_ARGUMENTS }

SELECT number
FROM numbers(100e6)
ORDER BY number ASC
FORMAT Null
SETTINGS max_bytes_ratio_before_external_sort = 1; -- { serverError BAD_ARGUMENTS }