SELECT CAST(1 AS Enum8('hello' = 1, 'world' = 2));

SELECT CAST(1, 'Enum8(''hello'' = 1, ''world'' = 2)');

SELECT CAST(1 AS Enum8(
    'hello' = 1,
    'world' = 2));

SELECT CAST(1, 'Enum8(''hello'' = 1,\n\t''world'' = 2)');

SELECT toTimeZone(CAST(1 AS TIMESTAMP), 'UTC');

SELECT *
FROM cast;