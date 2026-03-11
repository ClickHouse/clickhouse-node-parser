SELECT dateTimeToUUIDv7();

SELECT dateTimeToUUIDv7('2021-08-15 18:57:56');

SELECT dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56'), 'extra');

SELECT dateTimeToUUIDv7(123.123456);

SELECT toTypeName(dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56')));

SELECT substring(hex(dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56'))), 13, 1);

SELECT bitAnd(bitShiftRight(toUInt128(dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56'))), 62), 3);

SELECT max(uuid) > min(uuid)
FROM (
        SELECT dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56')) AS uuid
        FROM numbers(2)
    );

SELECT dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56')) != dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:57'));

SELECT dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56', 'UTC')) != dateTimeToUUIDv7(toDateTime('2021-08-15 18:57:56', 'Asia/Shanghai'));

SELECT
    toDateTime('2021-08-15 18:57:56', 'UTC') AS d,
    UUIDv7ToDateTime(dateTimeToUUIDv7(d), 'UTC') == d,
    UUIDv7ToDateTime(dateTimeToUUIDv7(materialize(d)), 'UTC') == d;