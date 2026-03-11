SELECT replaceRegexpOne(create_table_query, 'CREATE TABLE [^ ]*', 'CREATE TABLE x') FROM system.tables WHERE database = currentDatabase() and table LIKE '.inner%' ORDER BY 1 FORMAT LineAsString;
