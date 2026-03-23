INSERT INTO FUNCTION file(concat(currentDatabase(), '/query.data'), 'RowBinary') SELECT toIntervalSecond(1)
SETTINGS interval_output_format = 'kusto';