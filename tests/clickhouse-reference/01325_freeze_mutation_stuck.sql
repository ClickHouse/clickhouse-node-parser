DROP TABLE IF EXISTS mt;
CREATE TABLE mt (x String, y UInt64, INDEX idx (y) TYPE minmax GRANULARITY 1) ENGINE = MergeTree ORDER BY y;
INSERT INTO mt VALUES ('Hello, world', 1);
SELECT * FROM mt;
SET mutations_sync = 1;
DROP TABLE mt;
