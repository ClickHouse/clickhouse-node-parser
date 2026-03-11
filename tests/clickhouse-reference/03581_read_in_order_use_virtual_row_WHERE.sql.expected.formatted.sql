SELECT
    _part,
    min(x),
    max(x)
FROM tab
GROUP BY _part
ORDER BY _part ASC;

SELECT x
FROM tab
WHERE bitAnd(y, 1023) == 0
ORDER BY x ASC
LIMIT 10
SETTINGS
    read_in_order_use_virtual_row = 1,
    log_processors_profiles = 1,
    optimize_move_to_prewhere = 0,
    max_threads = 2;