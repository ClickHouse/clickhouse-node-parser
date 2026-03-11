SELECT '-- information_schema.schemata';

SELECT *
FROM information_schema.schemata
WHERE ilike(schema_name, 'information_schema')
ORDER BY schema_name ASC;

SELECT *
FROM information_schema.tables
WHERE table_schema = currentDatabase()
    AND notLike(table_name, '%inner%')
ORDER BY table_name ASC;

SELECT *
FROM information_schema.views
WHERE table_schema = currentDatabase()
ORDER BY table_name ASC;

SELECT *
FROM information_schema.`columns`
WHERE table_schema = currentDatabase()
    AND notLike(table_name, '%inner%')
ORDER BY
    table_name ASC,
    column_name ASC;

SELECT *
FROM information_schema.key_column_usage
WHERE table_schema = currentDatabase()
    AND table_name = 'kcu1'
ORDER BY
    table_schema ASC,
    column_name ASC;

SELECT *
FROM information_schema.key_column_usage
WHERE table_schema = currentDatabase()
    AND table_name = 'kcu2'
ORDER BY
    table_schema ASC,
    column_name ASC;

SELECT *
FROM information_schema.referential_constraints;

SELECT *
FROM information_schema.statistics;

SELECT count()
FROM information_schema.TABLES
WHERE table_schema = currentDatabase()
    AND table_name = 't';

SELECT count()
FROM information_schema.taBLES
WHERE table_schema = currentDatabase()
    AND table_name = 't';