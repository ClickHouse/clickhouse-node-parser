SELECT
    name,
    engine,
    engine_full,
    create_table_query,
    data_paths,
    notEmpty([metadata_path]),
    notEmpty([uuid])
FROM `system`.tables
WHERE like(name, '%tablefunc%')
    AND database = currentDatabase()
ORDER BY name ASC;

SELECT count()
FROM {CLICKHOUSE_DATABASE:Identifier}.tablefunc01;

SELECT engine
FROM `system`.tables
WHERE name = 'tablefunc01'
    AND database = currentDatabase();