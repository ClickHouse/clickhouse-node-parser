-- Error cases
SELECT toUnixTimestamp64Second();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toUnixTimestamp64Milli();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toUnixTimestamp64Micro();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toUnixTimestamp64Nano();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toUnixTimestamp64Second('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT toUnixTimestamp64Milli('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT toUnixTimestamp64Micro('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT toUnixTimestamp64Nano('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT toUnixTimestamp64Second('abc', 123);  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toUnixTimestamp64Milli('abc', 123);  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toUnixTimestamp64Micro('abc', 123);  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toUnixTimestamp64Nano('abc', 123);  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
