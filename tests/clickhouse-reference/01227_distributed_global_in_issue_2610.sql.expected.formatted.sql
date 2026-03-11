SELECT *
FROM remote('127.1', currentDatabase(), data_01227)
PREWHERE key GLOBAL IN (
        SELECT key
        FROM data_01227
        PREWHERE key = 2
    );

SELECT *
FROM cluster('test_cluster_two_shards', currentDatabase(), data_01227)
PREWHERE key GLOBAL IN (
        SELECT key
        FROM data_01227
        PREWHERE key = 2
    );