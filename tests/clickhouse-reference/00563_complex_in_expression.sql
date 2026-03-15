set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE test_00563 ( dt Date, site_id Int32, site_key String ) ENGINE = MergeTree(dt, (site_id, site_key, dt), 8192);
SELECT * FROM test_00563 WHERE toInt32(site_id) IN (100);
SELECT * FROM test_00563 WHERE toInt32(site_id) IN (100,101);
CREATE TABLE join_with_index (key UInt32, data UInt64) ENGINE = MergeTree ORDER BY key SETTINGS index_granularity=1;
SELECT key + 1
FROM join_with_index
ALL INNER JOIN
(
    SELECT
        key,
        data
    FROM join_with_index
    WHERE toUInt64(data) IN (0, 529335254087962442)
) js2 USING (key);
SELECT _uniq, _uniq IN (0, 99)
FROM join_with_index
ARRAY JOIN
    [key, data] AS _uniq
ORDER BY _uniq;
