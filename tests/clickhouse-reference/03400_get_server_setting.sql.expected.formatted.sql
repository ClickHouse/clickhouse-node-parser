SELECT toBool(t1.val = t2.val) AS should_be_equal
FROM
    (
        SELECT toBool(value) AS val
        FROM `system`.server_settings
        WHERE name = 'allow_use_jemalloc_memory'
    ) AS t1
CROSS JOIN (
        SELECT getServerSetting('allow_use_jemalloc_memory') AS val
    ) AS t2;

SELECT toBool(t1.val = t2.val) AS should_be_equal
FROM
    (
        SELECT value AS val
        FROM `system`.server_settings
        WHERE name = 'mark_cache_policy'
    ) AS t1
CROSS JOIN (
        SELECT getServerSetting('mark_cache_policy') AS val
    ) AS t2;

SELECT ('TEST INVALID ARGUMENTS');

SELECT getServerSetting();

SELECT getServerSetting(10);

SELECT getServerSetting('allow_use_jemalloc_memory')(10);

SELECT getServerSetting('marks_compression_codec');

SELECT getServerSetting('allow_use_jemalloc_memory', 'background_merges_mutations_scheduling_policy');