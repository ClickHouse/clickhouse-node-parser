SELECT '-------------- Test copy sorting clauses from source table --------------';

CREATE TABLE x
(
    CounterID UInt32,
    EventDate Date,
    UserID UInt64
)
ENGINE = MergeTree
ORDER BY (CounterID, EventDate, intHash32(UserID))
PARTITION BY toYYYYMM(EventDate)
SAMPLE BY intHash32(UserID);

CREATE TABLE x_as AS x
ENGINE = MergeTree
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

CREATE TABLE x
(
    CounterID UInt32,
    EventDate Date,
    UserID UInt64
)
ENGINE = MergeTree
PRIMARY KEY (CounterID, EventDate, intHash32(UserID));

CREATE TABLE x_as AS x
ENGINE = MergeTree
ORDER BY (CounterID, EventDate, intHash32(UserID))
PARTITION BY toYYYYMM(EventDate)
SAMPLE BY intHash32(UserID)
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

CREATE TABLE x
(
    CounterID UInt32,
    EventDate Date,
    UserID UInt64
)
ENGINE = MergeTree
ORDER BY (CounterID);

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE x
(
    CounterID UInt32,
    EventDate Date,
    UserID UInt64
)
ENGINE = MergeTree(EventDate, intHash32(UserID), (CounterID, EventDate, intHash32(UserID)), 8192);

CREATE TABLE x_as AS x;