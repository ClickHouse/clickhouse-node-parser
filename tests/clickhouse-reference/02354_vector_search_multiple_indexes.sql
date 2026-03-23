-- Tags: no-fasttest, no-ordinary-database

-- Tests that multiple vector similarity indexes can be created on the same column (even if that makes no sense)

DROP TABLE IF EXISTS tab;
CREATE TABLE tab (id Int32, vec Array(Float32), PRIMARY KEY id, INDEX vec_idx(vec) TYPE vector_similarity('hnsw', 'L2Distance', 1));
DROP TABLE tab;
