DROP TABLE IF EXISTS table2;
CREATE TABLE table2
(
        EventDate Date,
        Id Int32,
        Value Int32
)
Engine = MergeTree()
PARTITION BY toYYYYMM(EventDate)
ORDER BY Id;
