SELECT *
FROM tab
ORDER BY name ASC
SETTINGS max_threads = 1;

SELECT *
FROM tab
SETTINGS max_threads = 1;

SELECT *
FROM tab
ORDER BY (flag, money) ASC
SETTINGS max_threads = 1;

SELECT *
FROM tab
ORDER BY (fixed_str, event_date) ASC
SETTINGS max_threads = 1;