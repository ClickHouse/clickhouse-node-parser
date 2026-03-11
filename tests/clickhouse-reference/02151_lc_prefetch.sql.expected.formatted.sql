SELECT count()
FROM tab_lc
WHERE y == '0'
SETTINGS local_filesystem_read_prefetch = 1;