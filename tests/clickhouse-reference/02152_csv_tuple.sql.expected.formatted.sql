CREATE TABLE test_02152
(
    x UInt32,
    y String,
    z Array(UInt32),
    t Tuple(UInt32, String, Array(UInt32))
)
ENGINE = File('CSV')
SETTINGS format_csv_delimiter = ';';

SELECT *
FROM test_02152;

CREATE TABLE test_02152
(
    x UInt32,
    y String,
    z Array(UInt32),
    t Tuple(UInt32, String, Array(UInt32))
)
ENGINE = File('CustomSeparated')
SETTINGS format_custom_field_delimiter = '<field_delimiter>', format_custom_row_before_delimiter = '<row_start>', format_custom_row_after_delimiter = '<row_end_delimiter>', format_custom_escaping_rule = 'CSV';