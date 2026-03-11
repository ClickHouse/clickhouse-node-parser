SELECT count()
FROM (
        SELECT key
        FROM t_union_remote
        UNION ALL
        SELECT key
        FROM remote('127.0.0.1', currentDatabase(), t_union_remote)
    )
WHERE key = 1;