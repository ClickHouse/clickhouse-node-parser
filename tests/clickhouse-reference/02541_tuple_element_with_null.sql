SELECT
    tupleElement(tuple, 'k1', 0) fine_k1_with_0,
    tupleElement(tuple, 'k1', NULL) k1_with_null,
    tupleElement(tuple, 'k2', 0) k2_with_0,
    tupleElement(tuple, 'k2', NULL) k2_with_null
FROM test_tuple_element;
