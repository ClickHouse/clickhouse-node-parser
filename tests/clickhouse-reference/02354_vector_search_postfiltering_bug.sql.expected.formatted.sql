-- Tags: no-fasttest, long, no-asan, no-ubsan, no-msan, no-tsan, no-debug
-- Test for Bug 78161
SET enable_analyzer = 1;

CREATE TABLE tab
(
    id Int32,
    vec Array(Float32)
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity = 128;