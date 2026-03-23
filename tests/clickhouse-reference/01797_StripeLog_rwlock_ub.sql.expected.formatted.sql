SYSTEM DROP  TABLE IF EXISTS underlying_01797;

CREATE TABLE underlying_01797
(
    key UInt64
)
ENGINE = StripeLog();

INSERT INTO FUNCTION remote('127.1', currentDatabase(), underlying_01797) SELECT toUInt64(number)
FROM `system`.numbers
LIMIT 1;

SELECT *
FROM underlying_01797
FORMAT Null;

SYSTEM DROP  TABLE underlying_01797;