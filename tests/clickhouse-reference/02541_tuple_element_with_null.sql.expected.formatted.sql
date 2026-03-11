SELECT
    tupleElement(tuple, 'k1', 0) AS fine_k1_with_0,
    tupleElement(tuple, 'k1', NULL) AS k1_with_null,
    tupleElement(tuple, 'k2', 0) AS k2_with_0,
    tupleElement(tuple, 'k2', NULL) AS k2_with_null
FROM test_tuple_element;