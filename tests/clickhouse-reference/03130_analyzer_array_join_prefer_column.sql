SELECT materialize(id), toTypeName(id)
FROM ( SELECT 'aaa' ) AS subquery
ARRAY JOIN [0] AS id
INNER JOIN test_table
USING (id)
;
SELECT materialize(id), toTypeName(id)
FROM ( SELECT 'aaa' ) AS subquery
ARRAY JOIN [0] AS id
INNER JOIN test_table
USING (id)
SETTINGS prefer_column_name_to_alias = 1
;
