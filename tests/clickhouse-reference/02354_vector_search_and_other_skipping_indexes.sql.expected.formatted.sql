CREATE TABLE tab
(
    val String,
    vec Array(Float32),
    INDEX ann_idx vec TYPE vector_similarity('hnsw', 'cosineDistance', 1),
    INDEX set_idx val TYPE set(100)
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO tab;