SELECT *
FROM format(CSV, 'd DateTime64(3)', '1744042005 797')
SETTINGS date_time_input_format = 'best_effort';

SELECT *
FROM format(CSV, 'd DateTime', '1744042005 797')
SETTINGS date_time_input_format = 'best_effort';