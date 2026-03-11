SELECT
    length(splitByChar('*', data_path)),
    replaceRegexpOne(data_path, '^.*/([^/]*)/', '\\1'),
    extract(last_exception, 'AUTHENTICATION_FAILED'),
    dateDiff('s', last_exception_time, now()) < 3600
FROM `system`.distribution_queue
WHERE database = currentDatabase()
    AND table = 'dist_01555'
FORMAT CSV;

SELECT
    length(splitByChar('*', data_path)),
    replaceRegexpOne(data_path, '^.*/([^/]*)/', '\\1')
FROM `system`.distribution_queue
WHERE database = currentDatabase()
    AND table = 'dist_01555'
FORMAT CSV;