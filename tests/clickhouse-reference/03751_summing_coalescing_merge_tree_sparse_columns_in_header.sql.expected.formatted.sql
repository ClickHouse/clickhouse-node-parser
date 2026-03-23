SYSTEM drop  table if exists src;

CREATE TABLE src
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO src SELECT 0
FROM numbers(1000000);

SYSTEM drop  table if exists dst;

CREATE TABLE dst
(
    x UInt64
)
ENGINE = CoalescingMergeTree
ORDER BY tuple();

INSERT INTO dst SELECT *
FROM src;

SYSTEM drop  table dst;

CREATE TABLE dst
(
    x UInt64
)
ENGINE = SummingMergeTree
ORDER BY tuple();

SYSTEM drop  table src;