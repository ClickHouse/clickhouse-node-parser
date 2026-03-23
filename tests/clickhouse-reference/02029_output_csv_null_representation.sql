CREATE TABLE test_data (
    col1 Nullable(String),
    col2 Nullable(String),
    col3 Nullable(String)
) ENGINE = Memory;
INSERT INTO test_data VALUES ('val1', NULL, 'val3');
SELECT * FROM test_data FORMAT CSV;
SET format_csv_null_representation = '∅';
SET format_csv_null_representation = '\\N';
