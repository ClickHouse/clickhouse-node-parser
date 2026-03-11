SELECT *
FROM remote('127.1', `system`.one)
SETTINGS
    optimize_skip_unused_shards = 1,
    force_optimize_skip_unused_shards = 2
FORMAT Null;