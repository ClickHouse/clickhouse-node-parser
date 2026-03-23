INSERT INTO FUNCTION file(concat(currentDatabase(), '_test_02244'), 'TSV', 'x String, y UInt32') SELECT
    'Hello, world!',
    42
SETTINGS engine_file_truncate_on_insert = 1;

INSERT INTO FUNCTION file(concat(currentDatabase(), '_test_02244'), 'CSV', 'x String, y UInt32') SELECT
    'Hello, world!',
    42
SETTINGS engine_file_truncate_on_insert = 1;

INSERT INTO FUNCTION file(concat(currentDatabase(), '_test_02244'), 'JSONCompactEachRow', 'x String, y UInt32') SELECT
    'Hello, world!',
    42
SETTINGS engine_file_truncate_on_insert = 1;

INSERT INTO FUNCTION file(concat(currentDatabase(), '_test_02244'), 'Values', 'x String, y UInt32') SELECT
    'Hello, world!',
    42
SETTINGS engine_file_truncate_on_insert = 1;