SELECT
    a.data,
    b.data
FROM test_new_json_type AS a
INNER JOIN test_new_json_type AS b ON a.id = b.id
ORDER BY id;
