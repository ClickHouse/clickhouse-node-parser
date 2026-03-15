-- Tags: no-tsan, no-asan, no-msan, no-fasttest
-- Test is slow
CREATE TABLE tab
(
    x DateTime('UTC'),
    y UInt32,
    v Int32
)
ENGINE = ReplacingMergeTree(v)
ORDER BY x;