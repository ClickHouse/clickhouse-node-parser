-- length should be 32
select length(hex(generateUUIDv4()));
-- hex on UUID always generate 32 characters even there're leading zeros
select lower(hex(toUUID('00000000-80e7-46f8-0000-9d773a2fd319')));
-- length should be 128
select length(bin(generateUUIDv4()));
-- bin on UUID always generate 128 characters even there're leading zeros
select bin(toUUID('00000000-80e7-46f8-0000-9d773a2fd319'));
