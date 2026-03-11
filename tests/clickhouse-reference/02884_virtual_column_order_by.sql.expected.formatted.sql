SELECT
    _file,
    *
FROM file('02884_{1,2}.csv')
ORDER BY _file ASC
SETTINGS max_threads = 1;