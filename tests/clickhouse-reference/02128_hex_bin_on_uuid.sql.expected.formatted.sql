SELECT length(hex(generateUUIDv4()));

SELECT lower(hex(toUUID('00000000-80e7-46f8-0000-9d773a2fd319')));

SELECT length(bin(generateUUIDv4()));

SELECT bin(toUUID('00000000-80e7-46f8-0000-9d773a2fd319'));