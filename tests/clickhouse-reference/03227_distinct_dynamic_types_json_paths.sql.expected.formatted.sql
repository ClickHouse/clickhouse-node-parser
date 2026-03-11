SELECT arrayJoin(distinctJSONPaths(json))
FROM test_json_dynamic_aggregate_functions;

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test_json_dynamic_aggregate_functions;

SELECT arrayJoin(distinctDynamicTypes(json.a2))
FROM test_json_dynamic_aggregate_functions;

SELECT arrayJoin(distinctDynamicTypes(json.a3))
FROM test_json_dynamic_aggregate_functions;

SELECT arrayJoin(distinctDynamicTypes(json.a42))
FROM test_json_dynamic_aggregate_functions;

SELECT arrayJoin(distinctJSONPaths(json))
FROM test_json_dynamic_aggregate_functions
WHERE dynamicType(json.a2) == 'String';

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test_json_dynamic_aggregate_functions
WHERE dynamicType(json.a2) == 'String';

SELECT arrayJoin(distinctDynamicTypes(json.a2))
FROM test_json_dynamic_aggregate_functions
WHERE dynamicType(json.a2) == 'String';

SELECT arrayJoin(distinctJSONPathsIf(json, dynamicType(json.a2) == 'String'))
FROM test_json_dynamic_aggregate_functions;

SELECT arrayJoin(distinctJSONPathsAndTypesIf(json, dynamicType(json.a2) == 'String'))
FROM test_json_dynamic_aggregate_functions;

SELECT arrayJoin(distinctDynamicTypesIf(json.a2, dynamicType(json.a2) == 'String'))
FROM test_json_dynamic_aggregate_functions;

SELECT
    dynamicType(json.a2),
    distinctJSONPaths(json)
FROM test_json_dynamic_aggregate_functions
GROUP BY dynamicType(json.a2)
ORDER BY dynamicType(json.a2) ASC;

SELECT
    dynamicType(json.a2),
    distinctJSONPathsAndTypes(json)
FROM test_json_dynamic_aggregate_functions
GROUP BY dynamicType(json.a2)
ORDER BY dynamicType(json.a2) ASC;

SELECT
    dynamicType(json.a2),
    distinctDynamicTypes(json.a2)
FROM test_json_dynamic_aggregate_functions
GROUP BY dynamicType(json.a2)
ORDER BY dynamicType(json.a2) ASC;

SELECT arrayJoin(distinctJSONPaths(json))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);

SELECT arrayJoin(distinctDynamicTypes(json.a2))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);

SELECT arrayJoin(distinctJSONPaths(json))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions)
WHERE dynamicType(json.a2) == 'String';

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions)
WHERE dynamicType(json.a2) == 'String';

SELECT arrayJoin(distinctDynamicTypes(json.a2))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions)
WHERE dynamicType(json.a2) == 'String';

SELECT arrayJoin(distinctJSONPathsIf(json, dynamicType(json.a2) == 'String'))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);

SELECT arrayJoin(distinctJSONPathsAndTypesIf(json, dynamicType(json.a2) == 'String'))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);

SELECT arrayJoin(distinctDynamicTypesIf(json.a2, dynamicType(json.a2) == 'String'))
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);

SELECT
    dynamicType(json.a2),
    distinctJSONPaths(json)
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions)
GROUP BY dynamicType(json.a2)
ORDER BY dynamicType(json.a2) ASC;

SELECT
    dynamicType(json.a2),
    distinctJSONPathsAndTypes(json)
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions)
GROUP BY dynamicType(json.a2)
ORDER BY dynamicType(json.a2) ASC;

SELECT
    dynamicType(json.a2),
    distinctDynamicTypes(json.a2)
FROM remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions)
GROUP BY dynamicType(json.a2)
ORDER BY dynamicType(json.a2) ASC;

SELECT distinctJSONPaths()
FROM test_json_dynamic_aggregate_functions;

SELECT distinctJSONPaths(json, 42)
FROM test_json_dynamic_aggregate_functions;

SELECT distinctJSONPaths(42)
FROM test_json_dynamic_aggregate_functions;

SELECT distinctJSONPathsAndTypes()
FROM test_json_dynamic_aggregate_functions;

SELECT distinctJSONPathsAndTypes(json, 42)
FROM test_json_dynamic_aggregate_functions;

SELECT distinctJSONPathsAndTypes(42)
FROM test_json_dynamic_aggregate_functions;

SELECT distinctDynamicTypes()
FROM test_json_dynamic_aggregate_functions;

SELECT distinctDynamicTypes(json.a2, 42)
FROM test_json_dynamic_aggregate_functions;

SELECT distinctDynamicTypes(42)
FROM test_json_dynamic_aggregate_functions;