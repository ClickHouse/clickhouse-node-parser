SELECT
    *,
    (
        SELECT toDateTime64(0, 3)
    )
FROM remote('127.0.0.1', `system`.one)
SETTINGS prefer_localhost_replica = 0;

SELECT
    *,
    (
        SELECT toDateTime64(5, 3)
    )
FROM remote('127.0.0.1', `system`.one)
SETTINGS prefer_localhost_replica = 0;

SELECT
    *,
    (
        SELECT toDateTime64('1970-01-01 00:45:25.456789', 6)
    )
FROM remote('127.0.0.1', `system`.one)
SETTINGS prefer_localhost_replica = 0;

SELECT
    *,
    (
        SELECT toDateTime64('1970-01-01 00:53:25.456789123', 9)
    )
FROM remote('127.0.0.1', `system`.one)
SETTINGS prefer_localhost_replica = 0;

SELECT
    *,
    (
        SELECT toDateTime64(NULL, 3)
    )
FROM remote('127.0.0.1', `system`.one)
SETTINGS prefer_localhost_replica = 0;

SELECT
    id,
    dt
FROM distr_03222_dt64
WHERE dt = (
        SELECT toDateTime64(0, 3)
    )
ORDER BY id ASC;

SELECT
    id,
    dt
FROM distr_03222_dt64
WHERE dt > (
        SELECT toDateTime64(0, 3)
    )
ORDER BY id ASC;

SELECT
    id,
    dt
FROM distr_03222_dt64
WHERE dt > (
        SELECT toDateTime64('1970-01-01 00:10:00.000', 3)
    )
ORDER BY id ASC;

SELECT
    id,
    dt
FROM distr_03222_dt64
WHERE dt < (
        SELECT toDateTime64(5, 3)
    )
ORDER BY id ASC;

SELECT count(*)
FROM distr_03222_dt64
WHERE dt > (
        SELECT toDateTime64('2024-07-20 00:00:00', 3)
    );

SELECT count(*)
FROM distr_03222_dt64
WHERE dt > (
        SELECT now()
    );

SELECT count(*)
FROM distr_03222_dt64
WHERE dt < (
        SELECT toDateTime64('2004-07-20 00:00:00', 3)
    );