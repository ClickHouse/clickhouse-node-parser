SELECT *
FROM format(TSV, '9279104479c7da1114861274de32208ead91b60e')
SETTINGS date_time_input_format = 'best_effort';

SELECT parseDateTime64BestEffortOrNull('9279104477', 9);

SELECT toDateTime64OrNull('9279104477', 9);