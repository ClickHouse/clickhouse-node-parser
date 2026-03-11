SELECT sum(x)
FROM replicated_with_sampling SAMPLE 1/2;

SELECT *
FROM replacing;

SELECT *
FROM replicated_collapsing;

SELECT *
FROM replicated_versioned_collapsing;

SELECT sleep(1);

SELECT is_leader
FROM `system`.replicas
WHERE database = currentDatabase()
    AND table = 'with_settings';