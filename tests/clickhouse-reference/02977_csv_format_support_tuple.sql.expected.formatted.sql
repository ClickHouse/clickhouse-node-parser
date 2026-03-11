SELECT *
FROM file(concat(currentDatabase(), '02977_1.csv'))
SETTINGS max_threads = 1;