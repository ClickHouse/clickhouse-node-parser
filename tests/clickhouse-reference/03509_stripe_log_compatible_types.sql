CREATE TABLE test_tz
(
    `dt` DateTime('UTC')
)
ENGINE = StripeLog;
INSERT INTO test_tz VALUES ('2022-09-21 03:03:24');
SELECT *
FROM test_tz;
