SELECT parseDateTime64BestEffort('2.55'); -- { serverError CANNOT_PARSE_DATETIME }

SELECT parseDateTime64BestEffortOrNull('2.55');