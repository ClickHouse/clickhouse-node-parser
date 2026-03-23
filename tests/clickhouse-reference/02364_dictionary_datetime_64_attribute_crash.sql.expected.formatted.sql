CREATE TABLE dat
(
    blockNum Decimal(10, 0),
    eventTimestamp DateTime64(9)
)
ENGINE = MergeTree()
PRIMARY KEY eventTimestamp;

INSERT INTO dat;

CREATE DICTIONARY datDictionary
(
    blockNum Decimal(10, 0),
    eventTimestamp DateTime64(9)
)
PRIMARY KEY blockNum
SOURCE(clickhouse(TABLE 'dat'))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT());

SELECT (
        SELECT eventTimestamp
        FROM datDictionary
    );

SELECT count(*)
FROM dat
WHERE eventTimestamp >= (
        SELECT eventTimestamp
        FROM datDictionary
    );