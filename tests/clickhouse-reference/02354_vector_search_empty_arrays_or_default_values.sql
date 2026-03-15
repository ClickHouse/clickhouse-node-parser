CREATE TABLE tab (id UInt64, vec Array(Float32), INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1)) ENGINE = MergeTree() ORDER BY id;
