-- Error cases
SELECT toStartOfSecond('123');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT toStartOfSecond(now());  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT toStartOfSecond();   -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toStartOfSecond(now64(), 123);   -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
