SELECT JSONAllPathsWithTypes(materialize('{"a" : [{"b" : 42}]}')::JSON);

SELECT getSubcolumn(materialize('{"a" : [{"b" : 42}]}')::JSON, 'a.:`Array(Nullable(JSON(max_dynamic_types=16, max_dynamic_paths=256)))`');