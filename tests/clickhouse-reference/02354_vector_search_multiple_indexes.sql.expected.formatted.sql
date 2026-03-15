CREATE TABLE tab
(
    id Int32,
    vec Array(Float32),
    INDEX vec_idx (vec) TYPE vector_similarity('hnsw', 'L2Distance', 1),
    PRIMARY KEY(id)
);