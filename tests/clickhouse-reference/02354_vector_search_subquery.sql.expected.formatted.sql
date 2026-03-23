-- Tags: no-fasttest, no-ordinary-database
SET enable_analyzer = 1; -- analyzer vs. non-analyzer produce slightly different EXPLAIN

-- Reference vector for vector search is computed by a subquery (issue #69085)
SYSTEM DROP  TABLE IF EXISTS tab;

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

SYSTEM DROP  TABLE tab;