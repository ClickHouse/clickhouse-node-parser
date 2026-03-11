SELECT name
FROM `system`.table_functions
WHERE length(description) < 10
    AND name NOT IN ('cosn', 'oss', 'hdfs', 'hdfsCluster', 'hive', 'mysql', 'postgresql', 's3', 's3Cluster', 'sqlite', 'urlCluster', 'mergeTreeParts')
ORDER BY name ASC;