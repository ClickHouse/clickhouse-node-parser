SELECT
    materialize('{"a" : [[1, {}], null]}')::JSON AS json,
    getSubcolumn(json, 'a'),
    dynamicType(getSubcolumn(json, 'a'));