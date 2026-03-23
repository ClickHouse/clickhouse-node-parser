-- Tags: no-fasttest, no-ordinary-database
-- Tests that quoted and unquoted parameters can be passed to vector search indexes.
DROP TABLE IF EXISTS tab1;

DROP TABLE IF EXISTS tab2;

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

DROP TABLE tab1;

DROP TABLE tab2;

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