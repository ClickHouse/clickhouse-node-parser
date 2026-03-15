CREATE TABLE buf_dest
(
    timestamp DateTime
)
ENGINE = MergeTree
ORDER BY (timestamp)
PARTITION BY toYYYYMMDD(timestamp);

CREATE TABLE buf
(
    timestamp DateTime
)
ENGINE = Buffer(currentDatabase(), buf_dest, 16, 86400, 86400, 2000000, 20000000, 100000000, 300000000);

SELECT *
FROM buf;

SELECT *
FROM buf
ORDER BY timestamp ASC;