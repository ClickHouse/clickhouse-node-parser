CREATE TABLE t0
(
    c0 Tuple(a Int32, b Nullable(Int32)),
    c1 Int32
)
ENGINE = SummingMergeTree()
ORDER BY c1;

SELECT c0
FROM t0 FINAL;

CREATE TABLE t0
(
    c0 Tuple(a Int32, b Nullable(Int32)),
    c1 Int32
)
ENGINE = CoalescingMergeTree()
ORDER BY c1;

CREATE TABLE t0
(
    c0 Array(Nullable(Int32)),
    c1 Int32
)
ENGINE = SummingMergeTree()
ORDER BY c1;

CREATE TABLE t0
(
    c0 Array(Nullable(Int32)),
    c1 Int32
)
ENGINE = CoalescingMergeTree()
ORDER BY c1;

CREATE TABLE t0
(
    c0 Tuple
)
ENGINE = CoalescingMergeTree()
ORDER BY tuple();

CREATE TABLE t0
(
    c0 Tuple
)
ENGINE = SummingMergeTree()
ORDER BY tuple();