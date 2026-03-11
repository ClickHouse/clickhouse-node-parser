SELECT * FROM tab ORDER BY name SETTINGS max_threads=1;
SELECT * FROM tab SETTINGS max_threads=1;
SELECT * FROM tab ORDER BY (flag, money) SETTINGS max_threads=1;
SELECT * FROM tab ORDER BY (fixed_str, event_date) SETTINGS max_threads=1;
