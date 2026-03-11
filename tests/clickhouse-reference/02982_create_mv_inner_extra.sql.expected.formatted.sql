SELECT replaceRegexpOne(create_table_query, 'CREATE TABLE [^ ]*', 'CREATE TABLE x')
FROM `system`.tables
WHERE database = currentDatabase()
    AND like(table, '.inner%')
ORDER BY 1 ASC
FORMAT LineAsString;