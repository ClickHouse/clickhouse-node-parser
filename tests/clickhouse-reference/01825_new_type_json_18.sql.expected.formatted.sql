SELECT
    id,
    data,
    JSONAllPathsWithTypes(data)
FROM t_json_2
ORDER BY id ASC;