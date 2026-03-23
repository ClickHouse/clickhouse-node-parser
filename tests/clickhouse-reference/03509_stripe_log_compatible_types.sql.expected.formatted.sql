SYSTEM DROP  TABLE IF EXISTS test_tz;

CREATE TABLE test_tz
(
    dt DateTime('UTC')
)
ENGINE = StripeLog;

INSERT INTO test_tz;

SELECT *
FROM test_tz;

SYSTEM DROP  TABLE test_tz;