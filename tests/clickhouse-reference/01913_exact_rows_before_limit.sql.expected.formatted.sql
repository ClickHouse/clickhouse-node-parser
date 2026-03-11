SELECT 0
FROM test_rows_compact_part
LIMIT 1
FORMAT JSONCompact
SETTINGS exact_rows_before_limit = 0, output_format_write_statistics = 0;

SELECT 0
FROM test_rows_compact_part
LIMIT 1
FORMAT JSONCompact
SETTINGS exact_rows_before_limit = 1, output_format_write_statistics = 0;

SELECT 0
FROM test_rows_wide_part
LIMIT 1
FORMAT JSONCompact
SETTINGS exact_rows_before_limit = 0, output_format_write_statistics = 0;

SELECT 0
FROM test_rows_wide_part
LIMIT 1
FORMAT JSONCompact
SETTINGS exact_rows_before_limit = 1, output_format_write_statistics = 0;