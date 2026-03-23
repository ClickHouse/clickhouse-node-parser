CREATE TABLE decimal_dt
(
    timestamp DateTime64(9)
)
ENGINE = MergeTree()
ORDER BY timestamp;

INSERT INTO decimal_dt;

SELECT count()
FROM decimal_dt
WHERE toDayOfWeek(timestamp) > 3;