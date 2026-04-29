SET date_time_input_format = 'basic';

DESCRIBE TABLE format(JSONEachRow, '{"d" : "5981 10:01.000"}');

SELECT *
FROM format(JSONEachRow, '{"d" : "5981 10:01.000"}');