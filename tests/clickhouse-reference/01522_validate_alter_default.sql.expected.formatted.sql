SYSTEM DROP  TABLE IF EXISTS table2;

CREATE TABLE table2
(
    EventDate Date,
    Id Int32,
    Value Int32
)
ENGINE = MergeTree()
ORDER BY Id
PARTITION BY toYYYYMM(EventDate);