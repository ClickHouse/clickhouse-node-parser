SELECT OperatingSystem
FROM test_generic_events_all
PREWHERE APIKey = 42
SETTINGS additional_table_filters = {'test_generic_events_all':'APIKey > 40'};
