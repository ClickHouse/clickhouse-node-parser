SELECT now64(10); -- { serverError ARGUMENT_OUT_OF_BOUND }

SELECT length(toString(now64(9)));