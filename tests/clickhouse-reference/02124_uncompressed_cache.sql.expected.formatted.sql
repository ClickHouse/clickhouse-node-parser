SELECT
    sum(n),
    count()
FROM t_uncompressed_cache
PREWHERE id = 0
    OR id = 5
    OR id = 100
SETTINGS use_uncompressed_cache = 0;

SELECT
    sum(n),
    count()
FROM t_uncompressed_cache
PREWHERE id = 0
    OR id = 5
    OR id = 100
SETTINGS use_uncompressed_cache = 1;