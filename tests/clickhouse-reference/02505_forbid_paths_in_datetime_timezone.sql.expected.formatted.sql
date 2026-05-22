SELECT toDateTime(0, '/abc'); -- { serverError BAD_ARGUMENTS }

SELECT toDateTime(0, './abc'); -- { serverError BAD_ARGUMENTS }

SELECT toDateTime(0, '../abc'); -- { serverError BAD_ARGUMENTS }

SELECT toDateTime(0, '~/abc'); -- { serverError BAD_ARGUMENTS }

SELECT toDateTime(0, 'abc/../../cba'); -- { serverError BAD_ARGUMENTS }