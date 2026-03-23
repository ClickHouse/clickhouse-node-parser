-- Tags: no-fasttest, no-ordinary-database
-- Tests that text search indexes use a (non-standard) index granularity of 64 by default.
SET enable_full_text_index = 1;

-- After CREATE TABLE
SYSTEM DROP  TABLE IF EXISTS tab;

CREATE TABLE tab
(
    k UInt64,
    s String,
    INDEX idx s TYPE text(tokenizer = ngrams(2))
)
ENGINE = MergeTree()
ORDER BY k;

SELECT granularity
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 'tab'
    AND name = 'idx';

SYSTEM DROP  TABLE tab;

-- After CREATE + ALTER ADD TABLE
CREATE TABLE tab
(
    k UInt64,
    s String
)
ENGINE = MergeTree()
ORDER BY k;