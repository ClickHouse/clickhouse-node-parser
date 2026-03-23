-- Tags: no-fasttest
INSERT INTO FUNCTION file(concat(currentDatabase(), '.parquet')) SELECT x
FROM format(RowBinary, 'x Bool', 'a');

SELECT
    x,
    reinterpret(x, 'UInt8')
FROM file(concat(currentDatabase(), '.parquet'));