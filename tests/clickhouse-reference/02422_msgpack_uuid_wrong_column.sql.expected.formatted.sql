-- Tags: no-parallel, no-fasttest
INSERT INTO FUNCTION file(`02422_data`.msgpack) SELECT toUUID('f4cdd80d-5d15-4bdc-9527-adcca635ec1f') AS uuid
SETTINGS output_format_msgpack_uuid_representation = 'ext';

SELECT *
FROM file(`02422_data`.msgpack, auto, 'x Int32'); -- {serverError ILLEGAL_COLUMN}