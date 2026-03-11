SELECT value
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/', currentDatabase(), '/versioned_collapsing_table/s1')
    AND name = 'metadata';

SELECT COUNT()
FROM versioned_collapsing_table;