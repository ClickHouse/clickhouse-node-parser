CREATE TABLE t0
(
    c0 Map(Int, Int),
    c1 Nullable(BFloat16)
)
ENGINE = MergeTree()
ORDER BY (c1, c0)
SETTINGS allow_nullable_key = 1;

SELECT c1
FROM t0
ORDER BY c1 ASC;