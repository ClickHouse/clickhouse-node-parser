select arrayJoin(distinctJSONPaths(json)) from test_json_dynamic_aggregate_functions;
select arrayJoin(distinctJSONPathsAndTypes(json)) from test_json_dynamic_aggregate_functions;
select arrayJoin(distinctDynamicTypes(json.a2)) from test_json_dynamic_aggregate_functions;
select arrayJoin(distinctDynamicTypes(json.a3)) from test_json_dynamic_aggregate_functions;
select arrayJoin(distinctDynamicTypes(json.a42)) from test_json_dynamic_aggregate_functions;
select arrayJoin(distinctJSONPaths(json)) from test_json_dynamic_aggregate_functions where dynamicType(json.a2) == 'String';
select arrayJoin(distinctJSONPathsAndTypes(json)) from test_json_dynamic_aggregate_functions where dynamicType(json.a2) == 'String';
select arrayJoin(distinctDynamicTypes(json.a2)) from test_json_dynamic_aggregate_functions where dynamicType(json.a2) == 'String';
select arrayJoin(distinctJSONPathsIf(json, dynamicType(json.a2) == 'String')) from test_json_dynamic_aggregate_functions;
select arrayJoin(distinctJSONPathsAndTypesIf(json, dynamicType(json.a2) == 'String')) from test_json_dynamic_aggregate_functions;
select arrayJoin(distinctDynamicTypesIf(json.a2, dynamicType(json.a2) == 'String')) from test_json_dynamic_aggregate_functions;
select dynamicType(json.a2), distinctJSONPaths(json) from test_json_dynamic_aggregate_functions group by dynamicType(json.a2) order by dynamicType(json.a2);
select dynamicType(json.a2), distinctJSONPathsAndTypes(json) from test_json_dynamic_aggregate_functions group by dynamicType(json.a2) order by dynamicType(json.a2);
select dynamicType(json.a2), distinctDynamicTypes(json.a2) from test_json_dynamic_aggregate_functions group by dynamicType(json.a2) order by dynamicType(json.a2);
select arrayJoin(distinctJSONPaths(json)) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);
select arrayJoin(distinctJSONPathsAndTypes(json)) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);
select arrayJoin(distinctDynamicTypes(json.a2)) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);
select arrayJoin(distinctJSONPaths(json)) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions) where dynamicType(json.a2) == 'String';
select arrayJoin(distinctJSONPathsAndTypes(json)) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions) where dynamicType(json.a2) == 'String';
select arrayJoin(distinctDynamicTypes(json.a2)) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions) where dynamicType(json.a2) == 'String';
select arrayJoin(distinctJSONPathsIf(json, dynamicType(json.a2) == 'String')) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);
select arrayJoin(distinctJSONPathsAndTypesIf(json, dynamicType(json.a2) == 'String')) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);
select arrayJoin(distinctDynamicTypesIf(json.a2, dynamicType(json.a2) == 'String')) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions);
select dynamicType(json.a2), distinctJSONPaths(json) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions) group by dynamicType(json.a2) order by dynamicType(json.a2);
select dynamicType(json.a2), distinctJSONPathsAndTypes(json) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions) group by dynamicType(json.a2) order by dynamicType(json.a2);
select dynamicType(json.a2), distinctDynamicTypes(json.a2) from remote('127.0.0.{1,2,3}', currentDatabase(), test_json_dynamic_aggregate_functions) group by dynamicType(json.a2) order by dynamicType(json.a2);
select distinctJSONPaths() from test_json_dynamic_aggregate_functions; -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
select distinctJSONPaths(json, 42) from test_json_dynamic_aggregate_functions; -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
select distinctJSONPaths(42) from test_json_dynamic_aggregate_functions; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
select distinctJSONPathsAndTypes() from test_json_dynamic_aggregate_functions; -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
select distinctJSONPathsAndTypes(json, 42) from test_json_dynamic_aggregate_functions; -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
select distinctJSONPathsAndTypes(42) from test_json_dynamic_aggregate_functions; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
select distinctDynamicTypes() from test_json_dynamic_aggregate_functions; -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
select distinctDynamicTypes(json.a2, 42) from test_json_dynamic_aggregate_functions; -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
select distinctDynamicTypes(42) from test_json_dynamic_aggregate_functions; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
