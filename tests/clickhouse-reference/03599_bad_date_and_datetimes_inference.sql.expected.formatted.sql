SET date_time_input_format = 'basic';

SET session_timezone = 'UTC';

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1800-01-01"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1800-01-01", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1969-12-31"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1969-12-31", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1800-01-01 00:00:00"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1800-01-01 00:00:00", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1969-12-31 23:59:59"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1969-12-31 23:59:59", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "3000-01-01"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "3000-01-01", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "2149-06-07"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "2149-06-07", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "3000-01-01 00:00:00"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "3000-01-01 00:00:00", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "2106-02-07 06:28:16"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "2106-02-07 06:28:16", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1900-01-01"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1900-01-01", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1900-01-01 00:00:00"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1900-01-01 00:00:00", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1899-12-31 23:59:59"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "1899-12-31 23:59:59", "s" : "some string"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "2300-01-01 00:00:00.000000000"}');

SELECT
    d,
    toTypeName(d)
FROM format(JSONEachRow, '{"d" : "2300-01-01 00:00:00.000000000", "s" : "some string"}');

SELECT '----------------------------------------------';

SET date_time_input_format = 'best_effort';