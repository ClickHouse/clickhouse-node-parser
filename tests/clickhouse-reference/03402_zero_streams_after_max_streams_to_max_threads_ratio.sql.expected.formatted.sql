SELECT avg(id)
FROM `03402_data`
SETTINGS
    max_threads = 4,
    max_streams_to_max_threads_ratio = 0;

SELECT avg(id)
FROM `03402_data`
SETTINGS
    max_threads = 0,
    max_streams_to_max_threads_ratio = 0;

SELECT avg(id)
FROM `03402_data`
SETTINGS
    max_threads = 2,
    max_streams_to_max_threads_ratio = 0.2;

SELECT id
FROM `03402_data`
ORDER BY id ASC
LIMIT 1
SETTINGS
    max_threads = 4,
    max_streams_to_max_threads_ratio = 0;

SELECT id
FROM `03402_data`
ORDER BY id ASC
LIMIT 1
SETTINGS
    max_threads = 0,
    max_streams_to_max_threads_ratio = 0;

SELECT id
FROM `03402_data`
ORDER BY id ASC
LIMIT 1
SETTINGS
    max_threads = 2,
    max_streams_to_max_threads_ratio = 0.2;