SELECT toTypeName(generateUUIDv7());

SELECT substring(hex(generateUUIDv7()), 13, 1);

SELECT bitAnd(bitShiftRight(toUInt128(generateUUIDv7()), 62), 3);

SELECT generateUUIDv7(1) = generateUUIDv7(2);

SELECT generateUUIDv7() = generateUUIDv7(1);

SELECT generateUUIDv7(1) = generateUUIDv7(1);