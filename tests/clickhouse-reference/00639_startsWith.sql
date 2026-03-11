SELECT startsWith(s, 'He') FROM (SELECT arrayJoin(['', 'H', 'He', 'Hellow', '3434', 'fffffffffdHe']) AS s);
SELECT startsWith(s, '') FROM (SELECT arrayJoin(['', 'h', 'hi']) AS s);
SELECT startsWith('123', '123');
SELECT startsWith('123', '12');
SELECT startsWith('123', '1234');
SELECT startsWith('123', '');
SELECT COUNT() FROM startsWith_test WHERE startsWith(S1, S1);
SELECT COUNT() FROM startsWith_test WHERE startsWith(S1, S2);
SELECT COUNT() FROM startsWith_test WHERE startsWith(S2, S3);
