CREATE TABLE test_tz
(
    dt DateTime('UTC')
)
ENGINE = StripeLog;

SELECT *
FROM test_tz;