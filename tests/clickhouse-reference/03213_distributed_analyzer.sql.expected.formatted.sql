SELECT sum(*)
FROM remote('127.0.0.4', currentDatabase(), viewExplain('EXPLAIN PIPELINE', 'graph = 1', (
        SELECT *
        FROM remote('127.0.0.4', `system`, one)
    )));

SELECT groupArray(*)
FROM cluster(test_cluster_two_shards, viewExplain('EXPLAIN PIPELINE', 'graph = 1', (
        SELECT *
        FROM remote('127.0.0.4', `system`, one)
    )));