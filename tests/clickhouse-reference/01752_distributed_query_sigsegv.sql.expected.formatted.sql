SELECT throwIf(dummy = 0)
FROM remote('127.1', `system`.one);

SELECT throwIf(dummy = 0)
FROM remote('127.{1,2}', `system`.one);

SELECT throwIf(dummy = 0)
FROM remote('127.{1,2}', `system`.one)
SETTINGS prefer_localhost_replica = 0;

SELECT throwIf(dummy = 0)
FROM remote('127.{1,2}', `system`.one)
SETTINGS
    prefer_localhost_replica = 0,
    distributed_group_by_no_merge = 1;

SELECT throwIf(dummy = 0)
FROM remote('127.{1,2}', `system`.one)
SETTINGS
    prefer_localhost_replica = 0,
    distributed_group_by_no_merge = 2;