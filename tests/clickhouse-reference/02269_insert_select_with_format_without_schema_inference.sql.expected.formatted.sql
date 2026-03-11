SELECT *
FROM file(concat(currentDatabase(), '_02269_data'), 'RowBinary', 'x UInt8');