SELECT generateSnowflakeID(1, 2, 3);

SELECT generateSnowflakeID(1, 'not_an_int');

SELECT generateSnowflakeID(1, materialize(2));

SELECT bitAnd(bitShiftRight(generateSnowflakeID(), 63), 1) = 0;

SELECT generateSnowflakeID(1) = generateSnowflakeID(2);

SELECT generateSnowflakeID() = generateSnowflakeID(1);

SELECT generateSnowflakeID(1) = generateSnowflakeID(1);

SELECT bitAnd(bitShiftRight(generateSnowflakeID(1, 123), 12), 1024 - 1) = 123;

SELECT count(*)
FROM (
        SELECT DISTINCT generateSnowflakeID()
        FROM numbers(100)
    );