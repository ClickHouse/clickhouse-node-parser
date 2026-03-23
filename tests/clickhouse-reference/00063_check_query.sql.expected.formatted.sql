-- Tags: log-engine
SET check_query_single_value_result = 1;

CREATE TABLE check_query_tiny_log
(
    N UInt32,
    S String
)
ENGINE = TinyLog;

INSERT INTO check_query_tiny_log;

CREATE TABLE check_query_log
(
    N UInt32,
    S String
)
ENGINE = Log;

INSERT INTO check_query_log;