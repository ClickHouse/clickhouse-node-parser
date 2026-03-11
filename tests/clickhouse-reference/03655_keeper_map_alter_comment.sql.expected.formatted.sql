SELECT '-- Before ALTER:';

SELECT
    'local:',
    regexpExtract(create_table_query, '(`k`.+?)(\n|\\))', 1)
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = '03655_keepermap';

SELECT
    'keeper:',
    regexpExtract(value, '(`k`.+?)(\n|\\))', 1)
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/databases/', currentDatabase(), '/metadata');