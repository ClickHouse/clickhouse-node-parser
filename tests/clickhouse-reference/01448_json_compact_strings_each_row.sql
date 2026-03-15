SET input_format_null_as_default = 0;
SELECT 1;
/* Check JSONCompactStringsEachRow Output */
CREATE TABLE test_table (value UInt8, name String) ENGINE = MergeTree() ORDER BY value;
SELECT * FROM test_table FORMAT JSONCompactStringsEachRow;
SELECT 2;
/* Check Totals */
SELECT name, count() AS c FROM test_table GROUP BY name WITH TOTALS ORDER BY name FORMAT JSONCompactStringsEachRow;
SELECT 3;
/* Check JSONCompactStringsEachRowWithNames and JSONCompactStringsEachRowWithNamesAndTypes Output */
SELECT * FROM test_table FORMAT JSONCompactStringsEachRowWithNamesAndTypes;
SELECT '----------';
SELECT * FROM test_table FORMAT JSONCompactStringsEachRowWithNames;
SELECT 4;
/* Check Totals */
SELECT name, count() AS c FROM test_table GROUP BY name WITH TOTALS ORDER BY name FORMAT JSONCompactStringsEachRowWithNamesAndTypes;
SELECT 5;
/* Check JSONCompactStringsEachRow Input */
CREATE TABLE test_table (v1 String, v2 UInt8, v3 DEFAULT v2 * 16, v4 UInt8 DEFAULT 8) ENGINE = MergeTree() ORDER BY v2;
SELECT 6;
/* Check input_format_null_as_default = 1 */
SET input_format_null_as_default = 1;
SELECT 7;
/* Check Nested */
CREATE TABLE test_table_2 (v1 UInt8, n Nested(id UInt8, name String)) ENGINE = MergeTree() ORDER BY v1;
SELECT * FROM test_table_2 FORMAT JSONCompactStringsEachRow;
SELECT 8;
SELECT 9;
SELECT 10;
SET input_format_skip_unknown_fields = 1;
SELECT 11;
SELECT 12;
SELECT * FROM test_table_2 FORMAT JSONCompactStringsEachRowWithNamesAndTypes;
SELECT * FROM test_table_2 FORMAT JSONCompactStringsEachRowWithNames;
