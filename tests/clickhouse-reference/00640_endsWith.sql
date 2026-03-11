SELECT endsWith(s, 'ow') FROM (SELECT arrayJoin(['', 'o', 'ow', 'Hellow', '3434', 'owfffffffdHe']) AS s);
SELECT endsWith(s, '') FROM (SELECT arrayJoin(['', 'h', 'hi']) AS s);
SELECT endsWith('123', '3');
SELECT endsWith('123', '23');
SELECT endsWith('123', '32');
SELECT endsWith('123', '');
SELECT COUNT() FROM endsWith_test WHERE endsWith(S1, S1);
SELECT COUNT() FROM endsWith_test WHERE endsWith(S1, S2);
SELECT COUNT() FROM endsWith_test WHERE endsWith(S2, S3);
SELECT endsWith([], 'str'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
