CREATE TABLE src
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO src SELECT 0
FROM numbers(1000000);

CREATE TABLE dst
(
    x UInt64
)
ENGINE = CoalescingMergeTree
ORDER BY tuple();

INSERT INTO dst SELECT *
FROM src;

CREATE TABLE dst
(
    x UInt64
)
ENGINE = SummingMergeTree
ORDER BY tuple();