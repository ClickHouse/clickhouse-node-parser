CREATE TABLE buf_dest (timestamp DateTime)
ENGINE = MergeTree PARTITION BY toYYYYMMDD(timestamp)
ORDER BY (timestamp);
CREATE TABLE buf (timestamp DateTime) Engine = Buffer(currentDatabase(), buf_dest, 16, 3, 20, 2000000, 20000000, 100000000, 300000000);
SELECT * FROM buf;
SELECT * FROM buf ORDER BY timestamp;
