-- Tags: no-fasttest, no-ordinary-database
SET enable_analyzer = 1; -- analyzer vs. non-analyzer produce slightly different EXPLAIN

CREATE TABLE tab
(
    id Int32,
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'cosineDistance', 2, 'f16', 0, 0) GRANULARITY 2
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 3;

INSERT INTO tab;