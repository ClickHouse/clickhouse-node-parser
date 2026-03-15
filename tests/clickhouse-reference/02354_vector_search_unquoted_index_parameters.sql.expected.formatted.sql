CREATE TABLE tab1
(
    id Int32,
    vec Array(Float32),
    INDEX vec_idx vec TYPE vector_similarity('hnsw', 'L2Distance', 1),
    PRIMARY KEY(id)
);

CREATE TABLE tab2
(
    id Int32,
    vec Array(Float32),
    INDEX vec_idx vec TYPE vector_similarity(hnsw, L2Distance, 1),
    PRIMARY KEY(id)
);

CREATE TABLE tab1
(
    id Int32,
    vec Array(Float32),
    PRIMARY KEY(id)
);

CREATE TABLE tab2
(
    id Int32,
    vec Array(Float32),
    PRIMARY KEY(id)
);