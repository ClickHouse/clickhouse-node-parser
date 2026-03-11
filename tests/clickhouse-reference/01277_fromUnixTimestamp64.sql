-- -- Error cases
SELECT fromUnixTimestamp64Second();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT fromUnixTimestamp64Milli();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT fromUnixTimestamp64Micro();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT fromUnixTimestamp64Nano();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT fromUnixTimestamp64Second('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT fromUnixTimestamp64Milli('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT fromUnixTimestamp64Micro('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT fromUnixTimestamp64Nano('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT fromUnixTimestamp64Second('abc', 123);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT fromUnixTimestamp64Milli('abc', 123);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT fromUnixTimestamp64Micro('abc', 123);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT fromUnixTimestamp64Nano('abc', 123);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
