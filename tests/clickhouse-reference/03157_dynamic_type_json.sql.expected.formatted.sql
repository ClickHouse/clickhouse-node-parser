SELECT *
FROM test_deep_nested_json
ORDER BY i ASC;

SELECT
    d::Dynamic AS d1,
    dynamicType(d1)
FROM test_deep_nested_json
ORDER BY i ASC;