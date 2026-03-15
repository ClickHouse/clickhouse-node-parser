CREATE TABLE test_log
(
    crypto_name String,
    trade_date Date
)
ENGINE = Log;

SELECT count()
FROM test_log;

CREATE TABLE test_log
(
    crypto_name String,
    trade_date Date
)
ENGINE = StripeLog;