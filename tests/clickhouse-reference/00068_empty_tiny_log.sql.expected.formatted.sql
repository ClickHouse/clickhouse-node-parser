CREATE TABLE IF NOT EXISTS empty_tiny_log
(
    A UInt8
)
ENGINE = TinyLog;

SELECT A
FROM empty_tiny_log;

SYSTEM DROP  TABLE empty_tiny_log;