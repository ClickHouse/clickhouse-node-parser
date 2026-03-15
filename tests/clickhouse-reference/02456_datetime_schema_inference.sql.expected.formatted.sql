SELECT *
FROM format('TSV', '222222222222222');

SELECT *
FROM format('TSV', '22222222222.2222');

SET date_time_input_format = 'basic';

SELECT *
FROM format('TSV', '2022-04-22T03:45:06.381');

SELECT *
FROM format('TSV', '2022-04-22T03:45:06.381Z');

SELECT *
FROM format('TSV', '01/12/1925');

SET date_time_input_format = 'best_effort';

SELECT toTimeZone(c1, 'UTC')
FROM format('TSV', '2022-04-22T03:45:06.381Z');

SET date_time_input_format = 'best_effort_us';

SELECT *
FROM format(CSV, '""');