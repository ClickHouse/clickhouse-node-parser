-- Tags: no-fasttest, no-ordinary-database
-- Tests that various conditions are checked during creation of vector search indexes.
SYSTEM DROP  TABLE IF EXISTS tab;

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity()
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('cant have', 'two args')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('cant', 'have', 'four', 'args')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('cant', 'have', 'five', 'args', '!', '!')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('cant', 'have', 'seven', 'args', '!', '!', '!')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity(3, 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('not_hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_DATA }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 3, 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'invalid_distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_DATA }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 'invalid')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 0)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_DATA }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1, 1, 1, 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1, 'invalid', 2, 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_DATA }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1, 'f32', 'invalid', 1, 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1, 'f32', 1, 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_DATA }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 8, 'b1', 64, 128)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_DATA }

CREATE TABLE tab
(
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'cosineDistance', 7, 'b1', 64, 128)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_DATA }

CREATE TABLE tab
(
    id Int32,
    vec Array(Float32),
    INDEX idx tuple(vec, id) TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_NUMBER_OF_COLUMNS }

SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE tab
(
    vec UInt64,
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }

CREATE TABLE tab
(
    vec Float32,
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }

CREATE TABLE tab
(
    vec LowCardinality(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }

CREATE TABLE tab
(
    vec Nullable(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }

CREATE TABLE tab
(
    vec Array(UInt64),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }

CREATE TABLE tab
(
    vec Array(Nullable(Float32)),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }

CREATE TABLE tab
(
    vec Array(LowCardinality(Float32)),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }