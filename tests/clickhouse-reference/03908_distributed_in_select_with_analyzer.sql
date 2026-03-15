CREATE TABLE t_dist_in_select
(
    uid UInt32
) ENGINE = MergeTree() ORDER BY uid;
SELECT uid IN (1, 3)
FROM remote('127.0.0.1', currentDatabase(), t_dist_in_select)
ORDER BY uid;
