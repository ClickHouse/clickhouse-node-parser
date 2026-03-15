CREATE TABLE src
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE dst
(
    x UInt64
)
ENGINE = CoalescingMergeTree
ORDER BY tuple();

CREATE TABLE dst
(
    x UInt64
)
ENGINE = SummingMergeTree
ORDER BY tuple();