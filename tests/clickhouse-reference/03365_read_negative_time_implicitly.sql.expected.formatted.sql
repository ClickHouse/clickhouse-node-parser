SET enable_time_time64_type = 1;

CREATE OR REPLACE TABLE tx
(
    c0 Time
)
ENGINE = Memory;

SELECT c0
FROM tx;