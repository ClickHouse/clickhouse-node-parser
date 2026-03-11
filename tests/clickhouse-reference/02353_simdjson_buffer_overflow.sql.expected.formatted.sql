SELECT count()
FROM `system`.numbers_mt
WHERE NOT ignore(JSONExtract(concat('{', repeat('"a":"b",', rand() % 10), '"c":"d"}'), 'a', 'String'))
FORMAT Null;