SELECT *
FROM format(CSV, 'c1 DateTime, c2 String', '01-01-2000,abc')
SETTINGS date_time_input_format = 'best_effort';

SELECT *
FROM format(CSV, 'c1 DateTime64(3), c2 String', '01-01-2000,abc')
SETTINGS date_time_input_format = 'best_effort';