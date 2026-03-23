CREATE TABLE foo
(
    Id Int32,
    Val Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY Id;

INSERT INTO foo;

CREATE TABLE merge1
(
    Id Int32,
    Val Int32
)
ENGINE = Merge(currentDatabase(), '^foo');

SELECT Val
FROM merge1
PREWHERE Val = 65536
    OR Val = 2; -- { serverError ILLEGAL_PREWHERE }

CREATE TABLE merge2
(
    Id Int32,
    Val Nullable(Int32)
)
ENGINE = Merge(currentDatabase(), '^foo');

SELECT Val
FROM merge2
PREWHERE Val = 65536
    OR Val = 2;