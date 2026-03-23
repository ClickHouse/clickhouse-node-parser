CREATE TABLE test_01073_crlf_end_of_line (value UInt8, word String) ENGINE = MergeTree() ORDER BY value;
INSERT INTO test_01073_crlf_end_of_line VALUES (1, 'hello'), (2, 'world');
SELECT * FROM test_01073_crlf_end_of_line FORMAT CSV SETTINGS output_format_csv_crlf_end_of_line = 1;
SELECT * FROM test_01073_crlf_end_of_line FORMAT CSV SETTINGS output_format_csv_crlf_end_of_line = 0;
