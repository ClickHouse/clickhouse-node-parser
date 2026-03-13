SELECT toInt64('--1'); -- { serverError CANNOT_PARSE_NUMBER }

SELECT toInt64('+-1'); -- { serverError CANNOT_PARSE_NUMBER }

SELECT toInt64('++1'); -- { serverError CANNOT_PARSE_NUMBER }

SELECT toInt64('++'); -- { serverError CANNOT_PARSE_NUMBER }

SELECT toInt64('+'); -- { serverError CANNOT_PARSE_NUMBER }

SELECT toInt64('1+1'); -- { serverError CANNOT_PARSE_TEXT }

SELECT toInt64('1-1'); -- { serverError CANNOT_PARSE_TEXT }

SELECT toInt64(''); -- { serverError ATTEMPT_TO_READ_AFTER_EOF }

SELECT toInt64('1');

SELECT toInt64('-1');