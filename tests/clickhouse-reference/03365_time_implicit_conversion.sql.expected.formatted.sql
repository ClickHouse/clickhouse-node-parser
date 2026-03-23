SET allow_experimental_time_time64_type = 1;

CREATE TABLE dt
(
    time Time,
    event_id UInt8
)
ENGINE = TinyLog;

INSERT INTO dt;

SELECT *
FROM dt
WHERE time = '100:00:00';