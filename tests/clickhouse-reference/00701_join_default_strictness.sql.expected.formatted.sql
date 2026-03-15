SET send_logs_level = 'fatal';

CREATE TABLE a1
(
    a UInt8,
    b UInt8
)
ENGINE = Memory;

CREATE TABLE a2
(
    a UInt8,
    b UInt8
)
ENGINE = Memory;

SELECT
    a,
    b
FROM
    a1
LEFT JOIN (
        SELECT
            a,
            b
        FROM a2
    ) AS js2
    USING (a)
ORDER BY b ASC
SETTINGS join_default_strictness = 'ANY';

SELECT
    a,
    b
FROM
    a1
LEFT JOIN (
        SELECT
            a,
            b
        FROM a2
    ) AS js2
    USING (a)
ORDER BY b ASC; -- default SETTINGS join_default_strictness='ALL';