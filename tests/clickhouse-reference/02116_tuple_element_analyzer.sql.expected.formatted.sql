SELECT t1.1
FROM t_tuple_element;

SELECT t1.2
FROM t_tuple_element;

SELECT tupleElement(t1, 'a')
FROM t_tuple_element;

SELECT number.1
FROM numbers(1);

SELECT tupleElement(t1)
FROM t_tuple_element;

SELECT tupleElement(t1, 'b')
FROM t_tuple_element;

SELECT t1.0
FROM t_tuple_element;

SELECT t1.3
FROM t_tuple_element;

SELECT tupleElement(t1, materialize('a'))
FROM t_tuple_element;

SELECT t2.1
FROM t_tuple_element;

SELECT t2.1
FROM t_tuple_element;

SELECT tupleElement(t2)
FROM t_tuple_element;

SELECT tupleElement(t2, 'a')
FROM t_tuple_element;

SELECT t2.0
FROM t_tuple_element;

SELECT t2.3
FROM t_tuple_element;

SELECT tupleElement(t2, materialize(1))
FROM t_tuple_element;