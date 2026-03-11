SELECT toBool(t1.val = t2.val) AS should_be_equal
FROM
    (
        SELECT toString(value) AS val
        FROM `system`.merge_tree_settings
        WHERE name = 'index_granularity'
    ) AS t1
CROSS JOIN (
        SELECT toString(getMergeTreeSetting('index_granularity')) AS val
    ) AS t2;

SELECT toBool(t1.val = t2.val) AS should_be_equal
FROM
    (
        SELECT toString(value) AS val
        FROM `system`.merge_tree_settings
        WHERE name = 'max_merge_selecting_sleep_ms'
    ) AS t1
CROSS JOIN (
        SELECT toString(getMergeTreeSetting('max_merge_selecting_sleep_ms')) AS val
    ) AS t2;

SELECT ('TEST INVALID ARGUMENTS');

SELECT getMergeTreeSetting();

SELECT getMergeTreeSetting(10);

SELECT getMergeTreeSetting('index_granularity')(4096);

SELECT getMergeTreeSetting('keeper_multiread_batch_size');

SELECT getMergeTreeSetting('index_granularity', 'marks_compression_codec');