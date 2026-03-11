SELECT parseDateTimeBestEffort('<Empty>'); -- { serverError CANNOT_PARSE_DATETIME }
SELECT parseDateTimeBestEffortOrNull('<Empty>');
SELECT parseDateTimeBestEffortOrZero('<Empty>', 'UTC');
SELECT parseDateTime64BestEffort('<Empty>'); -- { serverError CANNOT_PARSE_DATETIME }
SELECT parseDateTime64BestEffortOrNull('<Empty>');
SELECT parseDateTime64BestEffortOrZero('<Empty>', 0, 'UTC');
SELECT toDateTime('<Empty>'); -- { serverError CANNOT_PARSE_DATETIME }
SELECT toDateTimeOrNull('<Empty>');
SELECT toDateTimeOrZero('<Empty>', 'UTC');
