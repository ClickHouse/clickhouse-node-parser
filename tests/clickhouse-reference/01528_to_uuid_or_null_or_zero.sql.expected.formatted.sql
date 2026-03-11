SELECT toUUID('61f0c404-5cb3-11e7-907b-a6006ad3dba0');

SELECT toUUID('61f0c404-5cb3-11e7-907b-a6006ad3dba0T');

SELECT toUUIDOrNull('61f0c404-5cb3-11e7-907b-a6006ad3dba0T');

SELECT toUUIDOrZero('59f0c404-5cb3-11e7-907b-a6006ad3dba0T');

SELECT toUUID(value)
FROM to_uuid_test;

SELECT toUUID(value)
FROM to_uuid_test
ORDER BY `ALL` ASC;

SELECT toUUIDOrNull(value)
FROM to_uuid_test
ORDER BY `ALL` ASC;

SELECT toUUIDOrZero(value)
FROM to_uuid_test
ORDER BY `ALL` ASC;