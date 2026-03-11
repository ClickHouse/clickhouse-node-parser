SELECT reverse((1, 'Hello', [2, 3]));

SELECT reverse(tuple)
FROM t_tuple;

SELECT
    tupleElement(reverse(tuple), 'a'),
    tupleElement(reverse(tuple), 'b')
FROM t_tuple;