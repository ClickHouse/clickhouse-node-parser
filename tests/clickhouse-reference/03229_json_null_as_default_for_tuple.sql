select materialize('{"a" : [[1, {}], null]}')::JSON as json, getSubcolumn(json, 'a'), dynamicType(getSubcolumn(json, 'a'));
