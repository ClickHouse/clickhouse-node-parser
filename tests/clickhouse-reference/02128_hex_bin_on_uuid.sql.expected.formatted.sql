-- length should be 32
SELECT length(hex(generateUUIDv4()));

WITH generateUUIDv4() AS uuid,

replace(toString(uuid), '-', '') AS str1,

lower(hex(uuid)) AS str2

SELECT str1 = str2;

-- hex on UUID always generate 32 characters even there're leading zeros
SELECT lower(hex(toUUID('00000000-80e7-46f8-0000-9d773a2fd319')));

-- length should be 128
SELECT length(bin(generateUUIDv4()));

-- bin on UUID always generate 128 characters even there're leading zeros
SELECT bin(toUUID('00000000-80e7-46f8-0000-9d773a2fd319'));