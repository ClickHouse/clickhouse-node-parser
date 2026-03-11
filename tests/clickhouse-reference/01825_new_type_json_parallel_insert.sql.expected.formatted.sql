SELECT
    groupUniqArrayMap(JSONAllPathsWithTypes(data)),
    count()
FROM t_json_parallel;