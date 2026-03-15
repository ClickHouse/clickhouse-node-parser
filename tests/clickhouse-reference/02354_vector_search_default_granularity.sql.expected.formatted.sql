CREATE TABLE tab
(
    id Int32,
    vec Array(Float32),
    INDEX idx (vec) TYPE vector_similarity('hnsw', 'L2Distance', 1)
)
ENGINE = MergeTree
ORDER BY id;

SELECT granularity
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 'tab'
    AND name = 'idx';

CREATE TABLE tab
(
    id Int32,
    vec Array(Float32)
)
ENGINE = MergeTree
ORDER BY id;