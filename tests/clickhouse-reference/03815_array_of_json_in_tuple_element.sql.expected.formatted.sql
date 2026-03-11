SELECT
    [['{"a" : 42}'::JSON]] AS data,
    tupleElement(data, 'a');