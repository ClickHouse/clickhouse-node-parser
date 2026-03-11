SELECT *
FROM file(concat(currentDatabase(), '_02293_data.arrow'))
SETTINGS max_threads = 1;