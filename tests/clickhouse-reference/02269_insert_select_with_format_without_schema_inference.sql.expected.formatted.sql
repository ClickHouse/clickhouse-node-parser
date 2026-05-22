INSERT INTO FUNCTION file(concat(currentDatabase(), '_02269_data'), 'RowBinary') SELECT 1
SETTINGS engine_file_truncate_on_insert = 1;

SELECT *
FROM file(concat(currentDatabase(), '_02269_data'), 'RowBinary', 'x UInt8');