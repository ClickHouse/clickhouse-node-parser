SELECT tupleToNameValuePairs(tuple(1, 2, 3));
SELECT tupleToNameValuePairs(col) FROM test02008 ORDER BY col;
SELECT untuple(arrayJoin(tupleToNameValuePairs(col))) from test02008;
SELECT tupleToNameValuePairs(tuple(1, 1.3)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT tupleToNameValuePairs(tuple(1, [1,2])); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT tupleToNameValuePairs(tuple(1, 'a')); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT tupleToNameValuePairs(33); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
