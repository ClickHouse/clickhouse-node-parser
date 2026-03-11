SELECT '-- UUIDToNum --';

SELECT UUIDToNum(toUUID('00112233-4455-6677-8899-aabbccddeeff'), 1) = UUIDStringToNum('00112233-4455-6677-8899-aabbccddeeff', 1);

SELECT UUIDToNum(toUUID('00112233-4455-6677-8899-aabbccddeeff'), 2) = UUIDStringToNum('00112233-4455-6677-8899-aabbccddeeff', 2);

SELECT UUIDToNum();

SELECT UUIDToNum(toUUID('00112233-4455-6677-8899-aabbccddeeff'), 1, 2);

SELECT UUIDToNum(toUUID('00112233-4455-6677-8899-aabbccddeeff'), 3);

SELECT UUIDToNum('00112233-4455-6677-8899-aabbccddeeff', 1);

SELECT UUIDToNum(toUUID('00112233-4455-6677-8899-aabbccddeeff'), '1');

SELECT UUIDToNum(toUUID('00112233-4455-6677-8899-aabbccddeeff'), materialize(1));

SELECT UUIDv7ToDateTime(toUUID('018f05c9-4ab8-7b86-b64e-c9f03fbd45d1'), 'America/New_York');

SELECT UUIDv7ToDateTime();

SELECT UUIDv7ToDateTime(toUUID('018f05c9-4ab8-7b86-b64e-c9f03fbd45d1'), 1);

SELECT UUIDv7ToDateTime(toUUID('018f05c9-4ab8-7b86-b64e-c9f03fbd45d1'), 'America/New_York', 1);

SELECT UUIDv7ToDateTime('018f05c9-4ab8-7b86-b64e-c9f03fbd45d1');

SELECT UUIDv7ToDateTime(toUUID('018f05c9-4ab8-7b86-b64e-c9f03fbd45d1'), 'America/NewYork');

SELECT UUIDv7ToDateTime(toUUID('018f05c9-4ab8-7b86-b64e-c9f03fbd45d1'), materialize('America/New_York'));