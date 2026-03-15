SET enable_analyzer = 1;

SELECT tupleElement('{"a" : 42}'::JSON, 'a');

SELECT tupleElement('{"a" : 42}'::JSON(a UInt32), 'a');

SELECT tupleElement(materialize('{"a" : 42}')::JSON, 'a');

SELECT tupleElement(materialize('{"a" : 42}')::JSON(a UInt32), 'a');

SELECT tupleElement('{"a" : 42}'::JSON, 'a');

SELECT tupleElement('{"a" : 42}'::JSON(a UInt32), 'a');

SELECT tupleElement(materialize('{"a" : 42}')::JSON, 'a');

SELECT tupleElement(materialize('{"a" : 42}')::JSON(a UInt32), 'a');

SELECT tupleElement(['{"a" : 42}']::Array(JSON)[1], 'a');

SELECT tupleElement(['{"a" : 42}']::Array(JSON(a UInt32))[1], 'a');

SELECT tupleElement(materialize(['{"a" : 42}'])::Array(JSON)[1], 'a');

SELECT tupleElement(materialize(['{"a" : 42}'])::Array(JSON(a UInt32))[1], 'a');

CREATE TABLE test
(
    json JSON(a UInt32)
)
ENGINE = Memory;

SELECT tupleElement(json, 'a')
FROM test;

SELECT tupleElement(json, 'b')
FROM test;

SELECT tupleElement(json, 'c')
FROM test;

SELECT tupleElement(json, 'c.:`Array(JSON)`')
FROM test;

SELECT tupleElement(json.c[1], 'd')
FROM test;