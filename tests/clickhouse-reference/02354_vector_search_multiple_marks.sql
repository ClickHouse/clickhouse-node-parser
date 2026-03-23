CREATE TABLE tab(id Int32, vec Array(Float32), INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 2)) ENGINE = MergeTree ORDER BY id SETTINGS index_granularity = 8192, index_granularity_bytes = 10485760;
INSERT INTO tab SELECT number, [toFloat32(number), 0.0] from numbers(10000);
