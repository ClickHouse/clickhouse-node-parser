CREATE TABLE test_generic_events_all
(
    APIKey UInt8,
    SessionType UInt8
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY APIKey;

CREATE ROW POLICY rp ON test_generic_events_all USING APIKey > 35 TO CURRENT_USER;

SELECT OperatingSystem
FROM test_generic_events_all
PREWHERE APIKey = 42
SETTINGS additional_table_filters = map('test_generic_events_all', 'APIKey > 40');