CREATE TABLE t
(
    c0 DateTime,
    c1 DateTime,
    a DateTime ALIAS toStartOfFifteenMinutes(c0)
)
ENGINE = MergeTree()
ORDER BY tuple();