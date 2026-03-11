SELECT *
FROM `system`.table_engines
WHERE name IN ('MergeTree', 'ReplicatedCollapsingMergeTree')
ORDER BY name ASC
FORMAT PrettyCompactNoEscapes;