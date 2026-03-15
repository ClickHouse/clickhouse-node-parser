SET date_time_input_format = 'basic';

SELECT *
FROM format(JSONEachRow, '{"d" : "5981 10:01.000"}');