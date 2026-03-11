SELECT tupleToNameValuePairs(tuple(1, 2, 3));

SELECT tupleToNameValuePairs(col)
FROM test02008
ORDER BY col ASC;

SELECT untuple(arrayJoin(tupleToNameValuePairs(col)))
FROM test02008;

SELECT tupleToNameValuePairs(tuple(1, 1.3));

SELECT tupleToNameValuePairs(tuple(1, [1,2]));

SELECT tupleToNameValuePairs(tuple(1, 'a'));

SELECT tupleToNameValuePairs(33);